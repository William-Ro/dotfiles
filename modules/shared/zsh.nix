{pkgs, ...}: {
  # Enable zsh
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    initExtra = ''
      # Plugin sudo manual (doble ESC para agregar sudo)
      sudo-command-line() {
        [[ -z $BUFFER ]] && zle up-history
        if [[ $BUFFER != sudo\ * ]]; then
          BUFFER="sudo $BUFFER"
          zle end-of-line
        fi
      }
      zle -N sudo-command-line
      bindkey -M emacs '^[^[' sudo-command-line
      bindkey -M viins '^[^[' sudo-command-line
    '';
  };

  home.shellAliases = {
    # Manual aliases
    ll = "lsd -lh --group-dirs=first";
    la = "lsd -a --group-dirs=first";
    l = "lsd --group-dirs=first";
    lla = "lsd -lha --group-dirs=first";
    ls = "lsd --group-dirs=first";
    cat = "bat";
    c = "bat";
    # Neovim aliases
    vim = "nvim";
    vi = "nvim";
    v = "nvim";
    # Lazygit alias
    lg = "lazygit";
    y = "yazi";
  };
  # Add new path to zshenv
  home.file.".zshenv" = {
    text = ''
      export PATH=$HOME/Development/flutter/bin:$PATH
    '';
  };

  # Install lsd and bat
  home.packages = [
    pkgs.lsd
    pkgs.bat
  ];
}
