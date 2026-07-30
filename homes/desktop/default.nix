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

    # gnome
    "gnome/extensions"
    "gnome/settings"
  ];

  home = {
    packages = with pkgs; [
      spotify

      # DevOps Tools
      gh
      kubectl
      helmfile
      kubernetes-helm
      fluxcd
      fluxcd-operator
      k9s

      # Desktop specific
      chromium
    ];
  };

  gtk = {
    enable = true;
    font = {
      name = "${config.font}";
      size = 11;
    };
    gtk4.theme = config.gtk.theme;
  };

  home.stateVersion = "24.05";
}
