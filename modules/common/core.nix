{pkgs, ...}: {
  home.packages = with pkgs; [
    zip
    xz
    unzip
    p7zip
    alejandra
    fontconfig
    cowsay
    file
    which
    tree
    glow
    vscode
  ];

  programs = {
    # terminal file manager
    yazi = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        manager = {
          show_hidden = true;
          sort_dir_first = true;
        };
      };
    };

    # skim provides a single executable: sk.
    # Basically anywhere you would want to use grep, try sk instead.
    skim = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
