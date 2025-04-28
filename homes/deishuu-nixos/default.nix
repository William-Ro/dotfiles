{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = lib.imports [
    # Common packages
    "common/alacritty"
    "common/direnv"
    "common/firefox"
    "common/ghostty"
    "common/git"
    "common/home"
    "common/lazygit"
    "common/starship"
    "common/vesktop"
    "common/vscode"
    "common/xdg"
    "common/yazi"
    "common/zsh"
    # nixOS specific packages
    "linux/dunst"
    "linux/hypridle"
    "linux/hyprlock"
    "linux/hyprland"
    "linux/waybar"
    "linux/wofi"
    # scripts
    "scripts/default"

    # dev
    "dev/cpp"

    # gaming
    "gaming/steam"
  ];

  home = {
    packages = with pkgs; [
      spotify
      qbittorrent
      wl-clipboard
      fastfetch
      pipes

      mpv # Media player (video & audio)
      playerctl # Command-line media player controller
      mpc # CLI client for Music Player Daemon (MPD)
      killall # Kill processes by name
      keychain # Manages SSH and GPG keys across sessions
      pamixer # PulseAudio volume control from the terminal

      gnome-calculator # Calculator
      evince # Document viewer
      file-roller # Archive manager
      eog # Eye of GNOME (image viewer)
      sushi # File previewer for Nautilus
      nautilus # File manager

      # Bluetooth manager
      overskride # Bluetooth management tool

      # Network manager applet
      networkmanagerapplet # GUI for managing network connections

      # Sound manager
      pavucontrol # Advanced PulseAudio volume control

      wf-recorder # Screen recording tool for Wayland
      komikku # Manga reader
      egl-wayland # EGL implementation for Wayland
      xournalpp # Note-taking application
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
