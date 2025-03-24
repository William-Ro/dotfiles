{pkgs, ...}: {
  home.packages = with pkgs; [
    spotify
    firefox
    postman
    lm_sensors
    telegram-desktop
    mpv
    qbittorrent
    dotnet-sdk_8
    dotnet-ef
    jetbrains.rider
  ];
  programs = {
  };
}
