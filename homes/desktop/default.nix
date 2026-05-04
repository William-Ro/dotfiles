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
      inputs.antigravity-nix.packages.${pkgs.stdenv.hostPlatform.system}.default
      inputs.cursor-nix.packages.${pkgs.stdenv.hostPlatform.system}.default
      wl-clipboard
      # Ebook related
      kcc
      gimp
      mcrcon

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

      # Desktop specific
      chromium
      lm_sensors
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
