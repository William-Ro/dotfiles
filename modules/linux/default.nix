{
  config,
  lib,
  pkgs,
  ...
}: {
  # Exclude default GNOME apps we don't need
  environment.gnome.excludePackages = with pkgs; [
    gnome-calendar
    gnome-weather
    simple-scan # Document scanner
  ];

  # Enable GNOME's file indexing and search
  services.gnome.tracker-miners.enable = true;
  services.gnome.tracker.enable = true;
}
