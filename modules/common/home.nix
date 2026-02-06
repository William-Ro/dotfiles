{
  config,
  pkgs,
  system,
  ...
}: {
  home = {
    username = config.username;
    homeDirectory =
      {
        x86_64-linux = "/home/${config.username}";
        aarch64-linux = "/home/${config.username}";
        aarch64-darwin = "/Users/${config.username}";
      }
      .${
        system
      };
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
