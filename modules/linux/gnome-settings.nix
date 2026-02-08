{
  config,
  lib,
  pkgs,
  ...
}: {
  # GNOME dconf settings
  dconf.settings = {
    # Desktop Interface Settings
    "org/gnome/desktop/interface" = {
      clock-show-weekday = true;
      enable-hot-corners = false;
      gtk-theme = "Adwaita-dark";
      color-scheme = "prefer-dark";
      show-battery-percentage = true;
    };

    # Window Manager Preferences
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
      num-workspaces = 9;
    };

    # Keyboard Settings
    "org/gnome/desktop/wm/keybindings" = {
      close = ["<Super>q"];
      switch-to-workspace-1 = ["<Alt>1"];
      switch-to-workspace-2 = ["<Alt>2"];
      switch-to-workspace-3 = ["<Alt>3"];
      switch-to-workspace-4 = ["<Alt>4"];
      switch-to-workspace-5 = ["<Alt>5"];
      switch-to-workspace-6 = ["<Alt>6"];
      switch-to-workspace-7 = ["<Alt>7"];
      switch-to-workspace-8 = ["<Alt>8"];
      switch-to-workspace-9 = ["<Alt>9"];
      move-to-workspace-1 = ["<Alt><Shift>1"];
      move-to-workspace-2 = ["<Alt><Shift>2"];
      move-to-workspace-3 = ["<Alt><Shift>3"];
      move-to-workspace-4 = ["<Alt><Shift>4"];
      move-to-workspace-5 = ["<Alt><Shift>5"];
      move-to-workspace-6 = ["<Alt><Shift>6"];
      move-to-workspace-7 = ["<Alt><Shift>7"];
      move-to-workspace-8 = ["<Alt><Shift>8"];
      move-to-workspace-9 = ["<Alt><Shift>9"];
    };

    # Shell Keybindings
    "org/gnome/shell/keybindings" = {
      toggle-application-view = ["<Alt>space"];
    };

    # Mouse & Touchpad
    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
      natural-scroll = false;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      natural-scroll = false;
      speed = 0.0;
    };

    # File Manager (Nautilus) Settings
    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "list-view";
      search-filter-time-type = "last_modified";
      show-hidden-files = true;
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      show-hidden = true;
      sort-directories-first = true;
    };

    # Power Settings
    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
      sleep-inactive-battery-timeout = 900; # 15 minutes
      power-button-action = "interactive";
    };

    # Privacy Settings
    "org/gnome/desktop/privacy" = {
      remember-recent-files = false;
      recent-files-max-age = 30;
      remove-old-trash-files = false;
      remove-old-temp-files = false;
      old-files-age = 30;
    };

    # Session Settings
    "org/gnome/desktop/session" = {
      idle-delay = lib.hm.gvariant.mkUint32 900; # 15 minutes
    };

    # Shell Settings
    "org/gnome/shell" = {
      favorite-apps = [];
    };

    # Mutter (Window Manager) Settings
    "org/gnome/mutter" = {
      edge-tiling = true;
      dynamic-workspaces = false;
      workspaces-only-on-primary = true;
      overlay-key = "";
    };
  };
}
