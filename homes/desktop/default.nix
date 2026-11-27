{
  config,
  lib,
  pkgs,
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
      gh
      kubectl
      helmfile
      kubernetes-helm
      fluxcd
      fluxcd-operator
      k9s
      chromium

      # AI
      herdr
      claude-code
      antigravity-cli
      codex
      github-copilot-cli
      cursor-cli
      # required by herdr's copilot hook (herdr-agent-state.sh)
      python3
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
