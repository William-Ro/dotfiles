{pkgs, ...}: {
  home.packages = with pkgs; [
    vscode
    docker-compose
    spotify
    firefox
    postman
    lm_sensors
    telegram-desktop
    mpv
    wl-clipboard
    pinentry
  ];

  programs = {
  };
}
