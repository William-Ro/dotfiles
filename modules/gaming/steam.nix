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
        MANGOHUD_CONFIG = "no_display,fps,cpu_stats,cpu_temp,gpu_stats,gpu_temp";
        GAMEMODERUN = "1";
        VKD3D_CONFIG = "dxr,dxr11";
        PROTON_LOCAL_SHADER_CACHE = "1";
        MESA_SHADER_CACHE_MAX_SIZE = "16G";
        MESA_GLSL_CACHE_MAX_SIZE = "16G";
        PROTON_ENABLE_NVAPI = "1"; 
        __GL_SHADER_DISK_CACHE_SKIP_CLEANUP = "1";
        __GL_SHADER_DISK_CACHE_SIZE = "17179869184";
      };
    };
  };
}
