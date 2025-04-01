{pkgs, ...}: {
  home.packages = with pkgs; [
    zip
    xz
    gh
    unzip
    p7zip
    alejandra
    docker-compose
    fontconfig
    cowsay
    file
    which
    tree
    glow
    ctop
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
