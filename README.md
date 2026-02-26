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

Enter the declarative build environment:

```bash
nix develop
```

This shell provides two wrapper functions (`os` and `hm`) to easily build and apply your configurations across macOS and NixOS.

### Applying System Configuration

Use the `os` function to apply a host configuration:

```bash
os <hostname>
```

### Applying Home Configuration

Use the `hm` function to apply a home-manager configuration:

```bash
hm <home-name>
```

### Updating Dependencies

Update the `flake.lock` inputs before rebuilding:

```bash
nix flake update
```
