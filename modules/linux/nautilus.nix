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
    eog # Eye of GNOME (image viewer)
    file-roller # Archive manager
    glib # Gsettings backend
  ];

  dconf.settings = {
    "org/gnome/desktop/privacy" = {
      "remember-recent-files" = false;
    };
    "org/gnome/nautilus/preferences" = {
      "default-folder-viewer" = "list-view";
      "show-hidden-files" = true;
      "sort-directories-first" = true;
    };
  };
}
