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
    "common/yazi"
    "common/zsh"
    "common/starship"
    "common/vscode"
    "common/nvchad"

    # gaming
    "gaming"

    # linux
    "linux/gnome-extensions"
    "linux/gnome-settings"
  ];

  home = {
    packages = with pkgs; [
      spotify
      qbittorrent
      inputs.antigravity-nix.packages.${pkgs.stdenv.hostPlatform.system}.default
      gh
      kubectl
      minikube
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
