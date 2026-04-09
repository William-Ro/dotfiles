<div align="center">

# deishuu dotfiles

Opinionated cross-platform system configuration built with `Nix flakes`, `home-manager`, and `nix-darwin`.

This repository manages a NixOS desktop, a NixOS laptop, and a macOS work machine from a single flake, using reusable modules for shared tools and machine-specific overrides where needed.

</div>

## Overview

The setup is split into three layers:

- `hosts/` for system-level machine definitions
- `homes/` for Home Manager user profiles
- `modules/` for reusable building blocks such as terminal, editor, browser, GNOME, and gaming configuration

### Available targets

| Target | Platform | Purpose | Highlights |
| --- | --- | --- | --- |
| `desktop` | `x86_64-linux` | Main NixOS desktop | NVIDIA, GNOME, Steam, Podman, desktop tooling |
| `laptop` | `x86_64-linux` | Portable NixOS setup | ThinkPad profile, GNOME, Tailscale, printing, dev tools |
| `work` | `aarch64-darwin` | macOS work machine | `nix-darwin`, Homebrew, Aerospace, shared dev environment |

## Included setup

- Terminal workflow with `zsh`, `starship`, `alacritty`, `yazi`, `bat`, and `lsd`
- Development tools such as `git`, `delta`, `lazygit`, `VS Code`, and `NvChad`
- Firefox with privacy-oriented defaults and curated extensions
- GNOME customization for Linux machines and `Aerospace` on macOS
- Gaming support on Linux with `Steam`, `MangoHud`, `gamescope`, and `gamemode`
- Shared fonts, system packages, and platform-specific extras managed declaratively

> [!NOTE]
> This is a personal setup. If you want to reuse it, review `modules/autoload/config.nix` first, then adapt the relevant files under `hosts/` and `homes/` to match your machine names, paths, and preferences.

## Repository layout

```text
.
├── bootstrap/   # flake bootstrap helpers and developer shell
├── homes/       # Home Manager profiles per machine
├── hosts/       # NixOS and nix-darwin host definitions
├── modules/     # reusable modules grouped by domain
└── flake.nix    # flake inputs and outputs
```

## Getting started

### Prerequisites

- [Nix](https://nixos.org/download/) with `flakes` and `nix-command` enabled
- A machine matching one of the declared targets, or your own adapted fork of this repo

### Clone and inspect

```bash
git clone <your-repo-url> ~/.dotfiles
cd ~/.dotfiles
nix flake show
```

### Enter the development shell

```bash
nix develop
```

The shell defined in `bootstrap/default.nix` provides two convenient helpers:

- `hm <name>` to apply a Home Manager profile
- `os <name>` to rebuild and switch a host configuration

> [!TIP]
> Running `nix develop` prints the available host and home targets so you can quickly see what can be applied on the current machine.

## Apply a configuration

### Home Manager only

```bash
home-manager switch --flake .#desktop
home-manager switch --flake .#laptop
home-manager switch --flake .#work
```

### NixOS hosts

```bash
sudo nixos-rebuild switch --flake .#desktop
sudo nixos-rebuild switch --flake .#laptop
```

### macOS host

```bash
sudo nix run nix-darwin -- switch --flake .#work
```

## Validation and maintenance

```bash
nix flake check --no-build
nix fmt
```

GitHub Actions in `.github/workflows/` also handle CI checks, dry-run builds, security scanning, automatic formatting, and scheduled flake input updates.
