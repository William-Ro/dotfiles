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

  # Configuración específica para macOS
  home-manager.sharedModules = lib.optional pkgs.stdenv.isDarwin {
    networking.computerName = hostname;
    system.defaults.smb.NetBIOSName = hostname;
  };

  # Definir usuario
  users.users."${username}" = {
    home =
      if pkgs.stdenv.isDarwin
      then "/Users/${username}"
      else "/home/${username}";
    description = username;
    extraGroups = ["networkmanager" "wheel"];
  };

  # Permitir usuario en trusted-users de Nix
  nix.settings.trusted-users = [username];
}
