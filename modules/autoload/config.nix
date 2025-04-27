{
  config,
  lib,
  system,
  ...
}:
with lib; {
  options = {
    username = mkOption {type = types.str;};
    usermail = mkOption {type = types.str;};
    homePath = mkOption {type = types.str;};
    dotfilesPath = mkOption {type = types.str;};
    wallpaperPath = mkOption {type = types.str;};
    gitSigningKey = mkOption {type = types.str;};
  };

  config = {
    # Replace with your own name
    username = "deishuu";
    usermail = "deishuu666@gmail.com";

    homePath =
      lib.mkDefault
      {
        x86_64-linux = "/home/${config.username}";
        aarch64-linux = "/home/${config.username}";
        aarch64-darwin = "/Users/${config.username}";
      }
      .${
        system
      };

    dotfilesPath = "${config.homePath}/dotfiles";

    wallpaperPath = "${config.homePath}/Pictures/wallpapers/default.jpg";

    # TODO Replace with your own GPG key
    gitSigningKey = "3F6BC2C89D644E2A";
  };
}
