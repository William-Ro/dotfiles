# NixOS and macOS Dotfiles

This repository contains my personal declarative system configuration files for NixOS and macOS.

## Configuration Structure

- `homes/` - Home-manager configurations (user-specific environments)
- `hosts/` - NixOS and nix-darwin configurations (system-level environments)
- `modules/` - Shared and modularized configurations
  - `common/` - Shared tools and dotfiles
  - `darwin/` - macOS specific modules
  - `linux/` - Linux specific modules (window managers, Wayland)
  - `system/` - Core system configurations (packages, Nix settings)
- `lib/` - Custom functions and system bootstrapping logic

### Managed Systems

- `desktop` (x86_64-linux)
- `laptop` (x86_64-linux)
- `work` (aarch64-darwin)

## Usage

### Applying System Configuration

Run the following command at the root of the repository to build and apply a host configuration:

#### Linux (NixOS)

```bash
sudo nixos-rebuild switch --flake .#<hostname>
```

#### macOS (nix-darwin)

```bash
darwin-rebuild switch --flake .#<hostname>
```

### Updating Dependencies

Update the inputs in `flake.lock` before rebuilding the system:

```bash
nix flake update
```
