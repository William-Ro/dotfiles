{
  pkgs,
  lib,
  ...
}: {
  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs.mangohud.enable = true;

  home.packages = with pkgs; [
    steam # Steam client
    gamescope # A micro-compositor for games
    mangohud # A Vulkan and OpenGL overlay for monitoring FPS, temperatures, CPU/GPU load, etc.
    gamemode # GameMode is a daemon/lib combo that allows you to request a set of optimizations on demand
    protonup # ProtonUp is a tool to install and manage custom Proton versions

    #steam-run # Run Steam games with a custom environment
    #protonup-ng # ProtonUp-NG is a tool to install and manage custom Proton versions
    #dxvk # DirectX to Vulkan translation layer
    #lutris # Lutris is a Games Launcher for Linux
    #r2modman # R2ModMan is a mod manager for games that use the BepInEx framework
    #heroic # Heroic Games Launcher is a free and open-source game launcher for Linux and macOS
    #er-patcher # A tool to patch games for the Epic Games Store
    #bottles # Bottles is a Games Launcher for Linux
  ];
}
