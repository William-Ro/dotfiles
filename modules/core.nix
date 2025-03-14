{pkgs, ...}: {
  home.packages = with pkgs; [
    # archives
    zip
    xz
    unzip
    p7zip
    alejandra
    fontconfig

    # misc
    cowsay
    file
    which
    tree

    # productivity
    glow # markdown previewer in terminal

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
