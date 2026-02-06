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
    gitUsername = mkOption {type = types.str;};
    gitUsermail = mkOption {type = types.str;};
    homePath = mkOption {type = types.str;};
    dotfilesPath = mkOption {type = types.str;};
    wallpaper = mkOption {type = types.str;};
    screenshots = mkOption {type = types.str;};
    font = mkOption {type = types.str;};
  };

  config = {
    # Replace with your own name
    username = "deishuu";
    usermail = "deishuu666@gmail.com";

    # Git configuration
    gitUsername = "William-Ro";
    gitUsermail = "william.r2409@gmail.com";

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
    wallpaper = "${config.homePath}/Pictures/Wallpapers/current.jpg";
    screenshots = "${config.homePath}/Pictures/Screenshots";
    font = "JetBrainsMono Nerd Font";
  };
}
