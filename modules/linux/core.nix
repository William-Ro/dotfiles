{pkgs, ...}: {
  home.packages = with pkgs; [
    spotify
    firefox
    qbittorrent

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
    eog # Eye of GNOME - image viewer

    # Bluetooth manager
    overskride # Bluetooth management tool

    # Network manager applet
    networkmanagerapplet # GUI for managing network connections

    # Sound manager
    pavucontrol # Advanced PulseAudio volume control
  ];
  programs = {
  };
}
