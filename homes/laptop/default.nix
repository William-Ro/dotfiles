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
    "common/vscode"
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

      # Ebook related
      hakuneko
      kcc
      gimp

      # DevOps Tools
      ansible
      awscli2
      kubectl
      gh
      git-lfs
      bfg-repo-cleaner
      terraform
      packer

      mpv # Media player (video & audio)
      imv # Image viewer
      killall # Kill processes by name
      komikku # Manga reader
      xournalpp # Note-taking application
      chromium
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
