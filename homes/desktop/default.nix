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
    "common/easyeffects"
    "common/vscode"
    "common/nvchad"
    "common/yazi"
    "common/zsh"
    "common/starship"

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
      wl-clipboard

      # DevOps Tools
      gh
      kubectl
      helmfile
      kubernetes-helm
      fluxcd
      fluxcd-operator
      k9s
      github-copilot-cli

      # Desktop specific
      chromium
      dig
      nvme-cli
      ledger-live-desktop
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
    gtk4.theme = config.gtk.theme;
  };

  programs = {
  };

  home.stateVersion = "24.05";
}
