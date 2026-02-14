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
    "common/yazi"
    "common/zsh"
    "common/starship"
    "common/vscode"
    "common/nvchad"

    # scripts
    #"scripts/default"

    # dev
    "dev/devenv"
    "dev/direnv"

    # gaming
    "gaming/default"

    # linux
    "linux/gnome-extensions"
    "linux/gnome-settings"
  ];

  home = {
    packages = with pkgs; [
      spotify
      qbittorrent
      nerdfetch
      pipes
      antigravity

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
