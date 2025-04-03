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
    nautilus
    eog
    sushi
    overskride
  ];
  programs = {
  };
}
