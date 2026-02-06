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

  # Create Discord wrapper with Wayland flags
  home.packages = [
    (pkgs.writeShellScriptBin "discord" ''
      exec ${pkgs.discord}/bin/discord \
        --enable-features=UseOzonePlatform,WaylandWindowDecorations,WebRTCPipeWireCapturer \
        --ozone-platform=wayland \
        --enable-gpu-rasterization \
        --enable-zero-copy \
        "$@"
    '')
  ];

  # Configure XDG config for VSCode
  xdg.configFile."code-flags.conf".text = ''
    --enable-features=UseOzonePlatform,WaylandWindowDecorations
    --ozone-platform=wayland
    --enable-wayland-ime
    --enable-gpu-rasterization
    --enable-zero-copy
  '';

  # Generic Electron apps flags
