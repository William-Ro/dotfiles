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
    "common/git"
    "common/home"
    "common/lazygit"
    "common/discord"
    "common/xdg"
    "common/yazi"
    "common/zsh"
    "common/starship"

    # scripts
    #"scripts/default"

    # dev
    "dev/devenv"
    "dev/direnv"

    # gaming
    "gaming/default"

    # linux
    "linux/gnome-extensions"
    "linux/electron"
  ];

  home = {
    packages = with pkgs; [
      prismlauncher
      spotify
      qbittorrent
      nerdfetch
      pipes

      mpv # Media player (video & audio)
      imv # Image viewer
      killall # Kill processes by name
      parted
      exfatprogs
      jq
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
