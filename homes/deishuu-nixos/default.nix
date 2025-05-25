{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = lib.imports [
    # Common packages
    "common/alacritty"
    "common/fastfetch"
    "common/firefox"
    "common/ghostty"
    "common/git"
    "common/home"
    "common/kitty"
    "common/lazygit"
    "common/starship"
    "common/vesktop"
    "common/vscode"
    "common/xdg"
    "common/yazi"
    "common/zsh"
    # nixOS specific packages
    "linux/dunst"
    "linux/hyprland"
    "linux/nautilus"
    "linux/rofi"
    "linux/waybar"

    # scripts
    "scripts/default"

    # dev
    "dev/python"
    "dev/devenv"
    "dev/direnv"

    # gaming
    "gaming/steam"
  ];

  home = {
    packages = with pkgs; [
      chromium # Web browser
      spotify
      qbittorrent
      wl-clipboard
      nerdfetch
      pipes

      mpv # Media player (video & audio)
      imv # Image viewer

      killall # Kill processes by name
      keychain # Manages SSH and GPG keys across sessions

      gnome-calculator # Calculator
      overskride # Bluetooth management tool
      networkmanagerapplet # GUI for managing network connections
      pavucontrol # Advanced PulseAudio volume control

      wf-recorder # Screen recording tool for Wayland
      komikku # Manga reader
      egl-wayland # EGL implementation for Wayland
      xournalpp # Note-taking application
      exfatprogs # Tools for exFAT filesystem
      speedtest-cli
      imagemagick
      prismlauncher
    ];

    sessionVariables = {
    };

    file = {
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Graphite-Dark";
      package = pkgs.graphite-gtk-theme.override {
        tweaks = ["darker"];
        themeVariants = ["default"];
        colorVariants = ["dark"];
      };
    };
    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela-black";
    };
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 23;
    };
    font = {
      name = "${config.font}";
      size = 11;
    };
  };

  programs = {
  };

  home.stateVersion = "24.05";
}
