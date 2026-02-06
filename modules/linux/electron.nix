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

  # Create optimized Discord wrapper
  home.packages = let
    discordWayland = pkgs.symlinkJoin {
      name = "discord-wayland";
      paths = [pkgs.discord];
      buildInputs = [pkgs.makeWrapper];
      postBuild = ''
        wrapProgram $out/bin/discord \
          --add-flags "--enable-features=UseOzonePlatform,WaylandWindowDecorations,WebRTCPipeWireCapturer" \
          --add-flags "--ozone-platform=wayland" \
          --add-flags "--enable-gpu-rasterization" \
          --add-flags "--enable-zero-copy" \
          --add-flags "--ignore-gpu-blocklist"
      '';
    };
  in [
    discordWayland
  ];

  # Configure XDG config for Electron apps
  xdg.configFile."code-flags.conf".text = ''
    --enable-features=UseOzonePlatform,WaylandWindowDecorations
    --ozone-platform=wayland
    --enable-wayland-ime
    --enable-gpu-rasterization
    --enable-zero-copy
  '';

  xdg.configFile."electron-flags.conf".text = ''
    --enable-features=UseOzonePlatform,WaylandWindowDecorations,WebRTCPipeWireCapturer
    --ozone-platform=wayland
    --enable-gpu-rasterization
    --enable-zero-copy
    --ignore-gpu-blocklist
  '';
}
