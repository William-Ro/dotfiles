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
    "common/yazi"
    "common/zsh"
    "common/starship"
    "common/vscode"
    # macOS specific packages
    "darwin/aerospace"

    # dev
    "dev/devenv"
    "dev/direnv"
  ];

  home = {
    packages = with pkgs; [
      nerdfetch
      oath-toolkit # fix pass support in Raycast
      tldr # collection of help pages for command-line
      shellcheck
      tree
      cargo
      exiftool
      code-cursor

      # DevOps Tools
      ansible
      awscli2
      kubectl
      gh
      git-lfs
      bfg-repo-cleaner
      terraform
      packer
      terragrunt
      neovim
    ];

    sessionVariables = {
      # Inlined from eval "$(/opt/homebrew/bin/brew shellenv)"
      HOMEBREW_PREFIX = "/opt/homebrew";
      HOMEBREW_CELLAR = "/opt/homebrew/Cellar";
      HOMEBREW_REPOSITORY = "/opt/homebrew";
      INFOPATH = "/opt/homebrew/share/info:''${INFOPATH:-}";

      # Include Homebrew in the PATH
      PATH = "/opt/homebrew/bin:/opt/homebrew/sbin:$PATH";

      # Fix Homebrew libs
      LDFLAGS = "-L/opt/homebrew/lib";
      CPPFLAGS = "-I/opt/homebrew/include";
    };

    file = {
      # Disable the Last login message in the terminal
      ".hushlogin".text = "";
    };
  };

  programs = {
  };

  home.stateVersion = "24.05";
}
