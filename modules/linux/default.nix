{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Exclude default GNOME apps we don't need
  environment.gnome.excludePackages = with pkgs; [
    epiphany 
    gnome-tour
    gnome-music
    totem
    geary
    gnome-calendar
    gnome-contacts
    gnome-maps
    gnome-weather
    simple-scan
    yelp
  ];

}
