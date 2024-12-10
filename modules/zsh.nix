{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    initExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
      sudo spctl --master-disable
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

  # Agregar lsd y bat
  home.packages = [
    pkgs.lsd
    pkgs.bat
  ];
}
