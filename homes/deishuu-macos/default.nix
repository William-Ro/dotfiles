{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = lib.imports [
    # Common packages
    "common/alacritty"
    "common/direnv"
    "common/fastfetch"
    "common/firefox"
    "common/ghostty"
    "common/git"
    "common/home"
    "common/lazygit"
    "common/starship"
    "common/vesktop"
    "common/vscode"
    "common/xdg"
    "common/yazi"
    "common/zsh"
    # macOS specific packages
    "darwin/aerospace"
  ];

  home = {
    packages = with pkgs; [
      brave
      hyperfine # benchmarking tool
      nerdfetch
      oath-toolkit # fix pass support in Raycast
      tldr # collection of help pages for command-line
      httpie # command-line HTTP client
      # dev env managed by mise, but here are some exceptions
      shellcheck
    ];

    sessionVariables = {
      # Inlined from eval "$(/opt/homebrew/bin/brew shellenv)"
      HOMEBREW_PREFIX = "/opt/homebrew";
      HOMEBREW_CELLAR = "/opt/homebrew/Cellar";
      HOMEBREW_REPOSITORY = "/opt/homebrew";
      INFOPATH = "/opt/homebrew/share/info:''${INFOPATH:-}";

      # Include Homebrew and Orbstack in the PATH
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
