{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Exclude default GNOME apps we don't need
  environment.gnome.excludePackages = with pkgs; [
    epiphany # GNOME Web browser (you have Firefox and Chromium)
    gnome-tour # First-run tour
    gnome-music # Music player (you have mpv)
    totem # Video player (you have mpv)
    geary # Email client
    gnome-calendar
    gnome-contacts
    gnome-maps
    gnome-weather
    simple-scan # Document scanner
    yelp # Help viewer
  ];

  # Enable GNOME's file indexing and search
  services.gnome.localsearch.enable = true;
  services.gnome.tinysparql.enable = true;
}
