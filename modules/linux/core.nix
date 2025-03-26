{pkgs, ...}: {
  home.packages = with pkgs; [
    spotify
    firefox
    postman
    lm_sensors
    telegram-desktop
    mpv
    qbittorrent
  ];
  programs = {
  };
}
