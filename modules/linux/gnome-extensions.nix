{ pkgs, ... }:
{
  # Install useful GNOME Extensions via home-manager
  home.packages = with pkgs.gnomeExtensions; [
    appindicator # Tray icons support
    clipboard-indicator # Clipboard manager
    no-overview
    user-themes # Required to apply a Shell theme (e.g. Nordic)
  ];
}
