{
  config,
  pkgs,
  system,
  ...
}: {
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
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
      fontconfig
    ];
  };
}
