{
  config,
  pkgs,
  lib,
  username,
  hostname,
  ...
}:
#############################################################
#
#  Host & Users configuration
#
#############################################################
{
  networking.hostName = hostname;

  home-manager.sharedModules = lib.optional pkgs.stdenv.isDarwin {
    #networking.computerName = hostname;
    #system.defaults.smb.NetBIOSName = hostname;
  };

  # User configuration
  users.users."${username}" =
    if pkgs.stdenv.isDarwin
    then {
      home = "/Users/${username}";
      description = username;
    }
    else {
      home = "/home/${username}";
      isNormalUser = true;
      description = username;
      extraGroups = ["networkmanager" "wheel" "docker"];
      shell = pkgs.zsh;
    };

  nix.settings = {
    trusted-users = [username];
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
}
