{pkgs, ...}: {
  home.packages = with pkgs; [
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
