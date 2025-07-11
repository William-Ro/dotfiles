{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    nautilus # File manager
    sushi # File previewer for Nautilus
    evince # Document viewer
    file-roller # Archive manager
    glib # Gsettings backend
    ffmpegthumbnailer # Video thumbnailer
  ];

  dconf.settings = {
    "org/gnome/desktop/privacy" = {
      "remember-recent-files" = false;
    };
    "org/gnome/nautilus/preferences" = {
      "default-folder-viewer" = "icon-view";
      "show-hidden-files" = true;
      "sort-directories-first" = true;
      "always-use-location-entry" = true;
      "show-image-thumbnails" = "always";
    };
  };
}
