{
  config,
  lib,
  system,
  ...
}:
with lib;
{
  options = {
    username = mkOption { type = types.str; };
    git_username = mkOption { type = types.str; };
    git_usermail = mkOption { type = types.str; };
    home_path = mkOption { type = types.str; };
    font = mkOption { type = types.str; };
  };

  config = {
    username = "deishuu";
    git_username = "William-Ro";
    git_usermail = "william.r2409@gmail.com";

    home_path = lib.mkDefault "/home/${config.username}";
    font = "JetBrainsMono Nerd Font";
  };
}
