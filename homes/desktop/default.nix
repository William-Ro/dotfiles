{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = lib.imports [
    # Common packages
    "common/alacritty"
    "common/fastfetch"
    "common/firefox"
    "common/ghostty"
    "common/git"
    "common/home"
    "common/kitty"
    "common/lazygit"
    "common/discord"
    "common/vscode"
    "common/xdg"
    "common/yazi"
    "common/fish"
    "common/starship"

    # scripts
    #"scripts/default"

    # dev
    "dev/devenv"
    "dev/direnv"

    # gaming
    "gaming/steam"
  ];

  home = {
    packages = with pkgs; [
      prismlauncher
      spotify
      qbittorrent
      wl-clipboard
      nerdfetch
      pipes

      # DevOps
      #terraform
      awscli2
      kubectl

      mpv # Media player (video & audio)
      killall # Kill processes by name
      komikku # Manga reader
      xournalpp # Note-taking application
      chromium
    ];

    sessionVariables = {
    };

    file = {
    };
  };

  gtk = {
    enable = true;
    font = {
      name = "${config.font}";
      size = 11;
    };
  };

  programs = {
  };

  home.stateVersion = "24.05";
}
