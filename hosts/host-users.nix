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

  # Permitir usuario en trusted-users de Nix
  nix.settings.trusted-users = [username];
}
