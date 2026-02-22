{
  pkgs,
  lib,
  ...
}:
{
  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs.mangohud.enable = true;

  home.packages = with pkgs; [
    gamescope
    mangohud
    gamemode
    protonup-ng
    steam-run
    dxvk
    r2modman
  ];
}
