{ pkgs, ... }:
{
  # Install useful GNOME Extensions via home-manager
  home.packages = with pkgs.gnomeExtensions; [
    appindicator # Tray icons support
    blur-my-shell # Modern blur effects
    vitals # System monitor in top bar
    clipboard-indicator # Clipboard manager
    no-overview
    caffeine
  ];
}
