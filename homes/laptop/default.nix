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
    "common/yazi"
    "common/zsh"
    "common/starship"
    "common/vscode"
    "common/nvchad"

    # gaming
    "gaming"

    # gnome
    "gnome/extensions"
    "gnome/settings"
  ];

  home = {
    packages = with pkgs; [
      spotify
      feishin
      gh
      kubectl
      helmfile
      kubernetes-helm
      fluxcd
      fluxcd-operator
      k9s
      chromium
    ];
  };

  gtk = {
    enable = true;
    font = {
      name = "${config.font}";
      size = 11;
    };
  };

  home.stateVersion = "24.05";
}
