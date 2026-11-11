# Playbook: add a new module

## Step 1: Decide where it belongs

| Scope | Location |
| --- | --- |
| Applies to **every** host and home, unconditionally | `modules/autoload/<name>.nix` |
| Shared home-manager config, opted in per home | `modules/common/<name>.nix` |
| Shared NixOS config, opted in per host | `modules/system/<name>.nix` |
| A cohesive feature area with its own sub-options (e.g. gaming, a desktop environment) | `modules/<category>/default.nix` (+ sibling files in the same directory) |

Modules under `modules/autoload/` have no explicit import step anywhere — a
file placed there affects every configuration the next time it's built. Don't
put anything there unless that's actually the intent.

## Step 2: Write the module

Follow the existing shape — a function of the standard module arguments,
returning an attrset:

```nix
{ config, lib, pkgs, ... }:
{
  # NixOS or home-manager options here
}
```

Look at [`modules/system/virtualisation.nix`](../../modules/system/virtualisation.nix)
(short, system-level) or
[`modules/common/git.nix`](../../modules/common/git.nix) (home-manager-level,
with `home.packages`/`programs.*`) as templates depending on which table row
above applies.

## Step 3: Import it (unless it's an autoload module)

Add the bare string to the `lib.imports [ ... ]` list in every
`hosts/<name>/default.nix` or `homes/<name>/default.nix` that should use it:

```nix
imports = lib.imports [
  # ...existing entries...
  "common/<name>"   # or "system/<name>", or "<category>" for a directory module
];
```

The string is resolved by `bootstrap/lib.nix`'s `imports` helper: it tries the
literal path first, then `modules/<string>/default.nix`, then
`modules/<string>.nix` — a typo surfaces as a Nix path-evaluation error, not a
clear "module not found" message.

## Step 4: Validate

```sh
nix shell nixpkgs#nixfmt --command nixfmt --check modules/<path>/<name>.nix
nix flake check --no-build
nix build .#nixosConfigurations.<host>.config.system.build.toplevel --dry-run   # if a NixOS module
nix build .#homeConfigurations.<home>.activationPackage --dry-run              # if a home-manager module
```

**Common pitfalls:** adding a module under `modules/autoload/` when it was
only meant for one host/home; forgetting that `modules/common/*` and
`modules/system/*` are meant to stay shared between both machines — put
machine-specific tweaks directly in `hosts/<name>/`/`homes/<name>/` instead of
branching inside a shared module on hostname.
