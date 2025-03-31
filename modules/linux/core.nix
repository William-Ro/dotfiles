{pkgs, ...}: {
  home.packages = with pkgs; [
    spotify
    firefox
    lm_sensors
    telegram-desktop
    mpv
    qbittorrent
    grimblast
    playerctl
    uwsm
    xfce.thunar
    keychain
  ];
  programs = {
  };
}
