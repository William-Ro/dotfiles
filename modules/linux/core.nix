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
    keychain
    hyprcursor
    egl-wayland
  ];
  programs = {
  };
}
