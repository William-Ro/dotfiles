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
    "common/ghostty"
    "common/git"
    "common/home"
    "common/lazygit"
    "common/starship"
    "common/vesktop"
    "common/vscode"
    "common/yazi"
    "common/zsh"
    # nixOS specific packages
    "linux/dunst"
    "linux/hypridle"
    "linux/hyprland"
    "linux/waybar"
    "linux/wofi"
    # scripts
    "scripts/default"
  ];

  home = {
    packages = with pkgs; [
      spotify
      firefox
      qbittorrent
      wl-clipboard

      nvidia-vaapi-driver # VA-API driver for NVIDIA GPUs (hardware acceleration)

      # Basic utilities
      lm_sensors # Hardware monitoring (temperature, voltage, fan speed)
      mpv # Media player (video & audio)
      playerctl # Command-line media player controller
      mpc # CLI client for Music Player Daemon (MPD)
      killall # Kill processes by name
      keychain # Manages SSH and GPG keys across sessions
      pamixer # PulseAudio volume control from the terminal
      # GNOME applications
      gnome-calculator
      evince
      file-roller
      nautilus
      eog
      sushi
      gvfs

      # Bluetooth manager
      overskride # Bluetooth management tool

      # Network manager applet
      networkmanagerapplet # GUI for managing network connections

      # Sound manager
      pavucontrol # Advanced PulseAudio volume control

      wf-recorder # Screen recording tool for Wayland
    ];
    

    sessionVariables = {
    };

    file = {
    };
  };

  programs = {
  };

  home.stateVersion = "24.05";
}
