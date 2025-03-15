{pkgs, ...}: {
  home.packages = with pkgs; [
    vscode
    docker-compose
    spotify
  ];

  programs = {
    firefox = {
      enable = true;
    };
  };
}
