{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = false;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;

    package = pkgs.steam.override {
      extraEnv = {
        MANGOHUD = "1";
        MANGOHUD_CONFIG = "read_cfg,no_display";
        GAMEMODERUN = "1";
        VKD3D_CONFIG = "dxr,dxr11";
        PROTON_LOCAL_SHADER_CACHE = "1";
        MESA_SHADER_CACHE_MAX_SIZE = "16G";
        WINE_VK_VULKAN_ONLY = "1";
        MESA_GLSL_CACHE_MAX_SIZE = "16G";
      };
    };
  };
}
