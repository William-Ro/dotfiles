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
    git_username = mkOption {type = types.str;};
    git_usermail = mkOption {type = types.str;};
    home_path = mkOption {type = types.str;};
    dotfiles_path = mkOption {type = types.str;};
    wallpaper = mkOption {type = types.str;};
    screenshots = mkOption {type = types.str;};
    font = mkOption {type = types.str;};
  };

  config = {
    username = "deishuu";
    git_username = "William-Ro";
    git_usermail = "william.r2409@gmail.com";

    home_path =
      lib.mkDefault
      {
        x86_64-linux = "/home/${config.username}";
        aarch64-linux = "/home/${config.username}";
        aarch64-darwin = "/Users/${config.username}";
      }
      .${
        system
      };
    screenshots = "${config.home_path}/Pictures/Screenshots";
    font = "JetBrainsMono Nerd Font";
  };
}
