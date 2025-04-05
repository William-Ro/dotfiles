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
    file
    which
    tree
    glow
    ctop
  ];

  programs = {
    # skim provides a single executable: sk.
    # Basically anywhere you would want to use grep, try sk instead.
    skim = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
