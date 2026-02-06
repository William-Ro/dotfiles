{
  config,
  pkgs,
  lib,
  ...
}: {
  home.sessionVariables = {
    # Enable Wayland support for Electron apps
    NIXOS_OZONE_WL = "1";
    
    # Electron performance flags
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
  };

  # Install Discord normally - flags will be read from electron-flags.conf
  home.packages = [
    pkgs.discord
  ];

  # Configure XDG config for Electron apps
  xdg.configFile."code-flags.conf".text = ''
    --enable-features=UseOzonePlatform,WaylandWindowDecorations
    --ozone-platform=wayland
    --enable-wayland-ime
    --enable-gpu-rasterization
    --enable-zero-copy
  '';

  xdg.configFile."discord-flags.conf".text = ''
    --enable-features=UseOzonePlatform,WaylandWindowDecorations,WebRTCPipeWireCapturer
    --ozone-platform=wayland
    --enable-gpu-rasterization
    --enable-zero-copy
  '';

  xdg.configFile."electron-flags.conf".text = ''
    --enable-features=UseOzonePlatform,WaylandWindowDecorations,WebRTCPipeWireCapturer
    --ozone-platform=wayland
    --enable-gpu-rasterization
    --enable-zero-copy
  '';
}
