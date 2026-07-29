{ pkgs, ... }:
{
  # Install useful GNOME Extensions via home-manager
  home.packages = with pkgs.gnomeExtensions; [
    appindicator # Tray icons support
    clipboard-indicator # Clipboard manager
    no-overview
  ];
}
