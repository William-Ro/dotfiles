<h2 align="center">NixOS/MacOS Dotfiles</h2>

<p align="center">
    <img src="https://img.shields.io/static/v1?label=Hyprland&message=Stable&style=flat&logo=hyprland&colorA=24273A&colorB=8AADF4&logoColor=CAD3F5"/>
</p>

<p align="center">
<a href="https://nixos.org/"><img src="https://img.shields.io/badge/NixOS-Unstable-informational.svg?style=flat&logo=nixos&logoColor=CAD3F5&colorA=24273A&colorB=8AADF4"></a>
### Apps:

|                          |                       NixOS                       |
| ------------------------ | :-----------------------------------------------: |
| **Desktop Environment**  |         [Hyprland](https://hyprland.org)          |
| **Terminal**             | [Ghostty](https://github.com/ghostty-org/ghostty) |
| **Display Server**       |    [Wayland](https://wayland.freedesktop.org)     |
| **Application Launcher** |     [Wofi](https://github.com/SimplyCEO/wofi)     |
| **Shell**                |         [Zsh](https://zsh.sourceforge.io)         |
| **Text Editor**          |            [Neovim](https://neovim.io)            |

### DE/WM

**Hyprland**

Desktop Environment:

<p align="center"><img src="https://imgur.com/iQUVcRU.png"></p>

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
