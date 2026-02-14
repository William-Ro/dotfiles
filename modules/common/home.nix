{
  config,
  pkgs,
  ...
}: {
  home = {
    username = config.username;
    homeDirectory = config.home_path;
    packages = with pkgs; [
      fontconfig
      home-manager
      zip
      xz
      unzip
      p7zip
      which
      glow
      ctop
      lsd
      bat
    ];
  };
}
