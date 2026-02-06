{
  config,
  pkgs,
  lib,
  ...
}: {
  home.sessionVariables = {
    # Enable Wayland support for Electron apps
    NIXOS_OZONE_WL = "1";
  };

  # Configure VSCode for Wayland
  xdg.configFile."code-flags.conf".text = ''
    --enable-features=UseOzonePlatform,WaylandWindowDecorations
    --ozone-platform=wayland
    --enable-wayland-ime
  '';

  # XDG Desktop Portal for screensharing support
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
    config.common.default = "*";
  };
}
