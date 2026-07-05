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
      prismlauncher
      spotify
      qbittorrent
      wl-clipboard
      # Ebook related
      kcc
      gimp
      mcrcon

      jellyfin-mpv-shim
      jellyfin-desktop

      # DevOps Tools
      gh
      kubectl
      helmfile
      kubernetes-helm
      fluxcd
      fluxcd-operator
      k9s
      flux9s
      bws
      github-copilot-cli

      # Desktop specific
      chromium
      lm_sensors
      dig
      nvme-cli
      ledger-live-desktop
      calibre
      osu-lazer
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
