# Playbook: add a new host

Adding a third machine (alongside `desktop`/`laptop`) means adding one entry
to the flake's output map plus two new directories — `bootstrap/` itself is a
generator and shouldn't need to change.

## Step 1: Generate hardware configuration

On the new machine, boot an installer and run:

```sh
nixos-generate-config --show-hardware-config > hardware-configuration.nix
```

Copy the result into `hosts/<name>/hardware-configuration.nix` once the
directory exists (Step 2). Don't hand-write this file — it's
machine-specific and not reproducible from this repo alone (see
[`AGENTS.md`](../../AGENTS.md) "Stop and ask before").

## Step 2: Create the host's NixOS configuration

Create `hosts/<name>/default.nix`, modeled on
[`hosts/laptop/default.nix`](../../hosts/laptop/default.nix) (the simpler of
the two existing hosts — skip `desktop`'s `nvidia.nix` import unless the new
machine also needs an NVIDIA driver):

```nix
{ config, inputs, lib, pkgs, ... }:
{
  imports = lib.imports [
    ./hardware-configuration.nix
    "system/nix"
    "system/packages"
    "system/locale"
    "system/audio"
    "system/virtualisation"
    "gaming/steam"
    "gnome"
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    timeout = 0;
  };

  # ... networking, services, users — copy from an existing host and adjust.

  system.stateVersion = "24.05"; # match the other hosts; don't bump without reason
}
```

## Step 3: Create the home-manager profile

Create `homes/<name>/default.nix`, modeled on
[`homes/laptop/default.nix`](../../homes/laptop/default.nix). Keep the
`common/*`/`gaming`/`gnome` imports identical to the existing homes unless the
new machine genuinely needs different packages — most of the divergence
between existing homes is a handful of `home.packages` lines, not a different
module list.

## Step 4: Wire it into the flake

Add the new host/home to the `x86_64-linux` map in
[`flake.nix`](../../flake.nix)'s `outputs`:

```nix
outputs = inputs: import ./bootstrap inputs {
  x86_64-linux = {
    homes.desktop = ./homes/desktop;
    hosts.desktop = ./hosts/desktop;
    homes.laptop = ./homes/laptop;
    hosts.laptop = ./hosts/laptop;
    homes.<name> = ./homes/<name>;
    hosts.<name> = ./hosts/<name>;
  };
};
```

## Step 5: Validate before switching

```sh
nix flake check --no-build
nix build .#nixosConfigurations.<name>.config.system.build.toplevel --dry-run
nix build .#homeConfigurations.<name>.activationPackage --dry-run
```

Only once both dry-run builds succeed, apply on the actual machine via the
`os`/`hm` devShell helpers
([`bootstrap/default.nix`](../../bootstrap/default.nix)):

```sh
nix develop
os <name>
hm <name>
```

**Common pitfalls:** forgetting to add both the `hosts.<name>` and
`homes.<name>` lines to `flake.nix` (the generator silently produces nothing
for whichever one is missing); copying `hosts/desktop/nvidia.nix`'s import
onto a machine with no NVIDIA GPU.
