{ pkgs, ... }:
{
  # Install useful GNOME Extensions via home-manager
  home.packages = with pkgs.gnomeExtensions; [
    appindicator # Tray icons support
    blur-my-shell
    clipboard-indicator # Clipboard manager
    no-overview
  ];
}
