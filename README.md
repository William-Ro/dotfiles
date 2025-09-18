<h2 align="center">NixOS/MacOS Dotfiles</h2>

## Nix Dotfiles Directory Structure

```
├── flake.nix
├── flake.lock
├── homes
│   ├── deishuu-macos
│   │   └── default.nix
│   └── deishuu-nixos
│       └── default.nix
├── hosts
│   ├── desktop
│   │   ├── default.nix
│   │   └── nvidia.nix
│   └── laptop
│       ├── default.nix
│       └── homebrew.nix
├── modules
│   ├── autoload
│   │   ├── config.nix
│   │   ├── hostname.nix
│   │   └── nixpkgs.nix
│   ├── common
│   │   ├── alacritty.nix
│   │   ├── direnv.nix
│   │   ├── ghostty.nix
│   │   └── ...
│   ├── darwin
│   │   └── aerospace.nix
│   ├── dev
│   ├── linux
│   │   ├── dunst.nix
│   │   ├── hypridle.nix
│   │   ├── hyprland.nix
│   │   ├── waybar.nix
│   │   └── wofi.nix
│   └── scripts
│       └── default.nix
├── lib
│   ├── bootstrap.nix
│   └── lib.nix
```

## About

This repository contains my personal dotfiles for NixOS and macOS.
They are highly opinionated and tailored to my own workflows and setups.

> ⚠️ **Disclaimer:**
> Use these dotfiles at your own risk. I am not responsible for any issues, data loss, or damages caused by applying this configuration to your system. If you’re going to use it, make sure to replace the `hardware-configuration.nix` file with the one generated for your own system. Using mine may cause boot or hardware issues.

## References

This project was heavily inspired by the following amazing repositories:

- [KubqoA/dotfiles](https://github.com/KubqoA/dotfiles)
- [dustinlyons/nixos-config](https://github.com/dustinlyons/nixos-config)
- [vimjoyer/nixconf](https://github.com/vimjoyer/nixconf)
