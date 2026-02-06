{
  config,
  pkgs,
  lib,
  ...
}: {
  # Configure VSCode for Wayland
  xdg.configFile."code-flags.conf".text = ''
    --enable-features=UseOzonePlatform,WaylandWindowDecorations
    --ozone-platform=wayland
    --enable-wayland-ime
  '';
}
