{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = lib.imports [
    # Common packages
    "common/alacritty"
    "common/fastfetch"
    "common/firefox"
    "common/git"
    "common/home"
    "common/lazygit"
    "common/discord"
    "common/vscode"
    "common/nvchad"
    "common/yazi"
    "common/zsh"
    "common/starship"

    # gaming
    "gaming/default"

    # linux
    "linux/gnome-extensions"
    "linux/gnome-settings"
  ];

  home = {
    packages = with pkgs; [
      prismlauncher
      spotify
      qbittorrent
      inputs.antigravity-nix.packages.${pkgs.stdenv.hostPlatform.system}.default

      # Ebook related
      kcc
      gimp

      # DevOps Tools
      gh
      kubectl

      # Desktop specific
      chromium
      lm_sensors
      dig
      nvme-cli
    ];

    sessionVariables = {
    };

    file = {
    };
  };

  gtk = {
    enable = true;
    font = {
      name = "${config.font}";
      size = 11;
    };
  };

  programs = {
  };

  home.stateVersion = "24.05";
}
