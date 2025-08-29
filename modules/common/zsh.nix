{pkgs, ...}: {
  # Enable zsh
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    initContent = ''
      # Sudo plugin
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

      # Yazi integration
      function y() {
       local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
       yazi "$@" --cwd-file="$tmp"
       if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
       fi
       rm -f -- "$tmp"
      }
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
    # Neovim aliases
    vim = "nvim";
    vi = "nvim";
    v = "nvim";
    # Lazygit alias
    lg = "lazygit";
  };
}
