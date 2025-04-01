{pkgs, ...}: {
  home.packages = with pkgs; [
    spotify
    firefox
    lm_sensors
    telegram-desktop
    mpv
    qbittorrent
    playerctl
    keychain
  ];
  programs = {
  };
}
