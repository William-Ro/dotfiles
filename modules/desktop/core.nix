{pkgs, ...}: {
  home.packages = with pkgs; [
    vscode
    docker-compose
    spotify
    firefox
  ];

  programs = {
  };
}
