{pkgs, ...}: {
  home.packages = with pkgs; [
    nvidia-vaapi-driver
    spotify
    firefox
    telegram-desktop
    qbittorrent
    lm_sensors
    mpv
    playerctl
    mpc
    killall
    keychain
    pamixer
    # GNOME Applications
    eog
    sushi
    # bluetooth manager
    overskride
    # network manager applet
    networkmanagerapplet
    # sound manager
    pavucontrol
  ];
  programs = {
  };
}
