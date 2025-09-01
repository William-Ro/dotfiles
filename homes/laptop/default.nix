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
    "common/starship"
    "common/xdg"
    "common/yazi"
    "common/zsh"
    # macOS specific packages
    "darwin/aerospace"
  ];

  home = {
    packages = with pkgs; [
      nerdfetch
      oath-toolkit # fix pass support in Raycast
      tldr # collection of help pages for command-line
      shellcheck
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
    zsh.initContent = ''
      # Inlined from ‹eval "$(/opt/homebrew/bin/brew shellenv)"›
      fpath+="/opt/homebrew/share/zsh/site-functions"

    '';
  };

  home.stateVersion = "24.05";
}
