{
  config,
  lib,
  pkgs,
  ...
}:
{
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      clock-show-weekday = true;
      clock-format = "12h";
      enable-hot-corners = false;
      gtk-theme = "Adwaita-dark";
      color-scheme = "prefer-dark";
      show-battery-percentage = true;
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
      num-workspaces = 9;
    };

    # Keyboard Settings
    "org/gnome/desktop/wm/keybindings" = {
      activate-window-menu = [ ];
      close = [ "<Alt>q" ];
      switch-to-workspace-1 = [ "<Alt>1" ];
      switch-to-workspace-2 = [ "<Alt>2" ];
      switch-to-workspace-3 = [ "<Alt>3" ];
      switch-to-workspace-4 = [ "<Alt>4" ];
      switch-to-workspace-5 = [ "<Alt>5" ];
      switch-to-workspace-6 = [ "<Alt>6" ];
      switch-to-workspace-7 = [ "<Alt>7" ];
      switch-to-workspace-8 = [ "<Alt>8" ];
      switch-to-workspace-9 = [ "<Alt>9" ];
      move-to-workspace-1 = [ "<Alt><Shift>1" ];
      move-to-workspace-2 = [ "<Alt><Shift>2" ];
      move-to-workspace-3 = [ "<Alt><Shift>3" ];
      move-to-workspace-4 = [ "<Alt><Shift>4" ];
      move-to-workspace-5 = [ "<Alt><Shift>5" ];
      move-to-workspace-6 = [ "<Alt><Shift>6" ];
      move-to-workspace-7 = [ "<Alt><Shift>7" ];
      move-to-workspace-8 = [ "<Alt><Shift>8" ];
      move-to-workspace-9 = [ "<Alt><Shift>9" ];

      maximize = [ "<Alt>Up" ];
      unmaximize = [ "<Alt>Down" ];

      # Disabled default keybinds
      begin-move = [ ];
      begin-resize = [ ];
      cycle-group = [ ];
      cycle-group-backward = [ ];
      cycle-panels = [ ];
      cycle-panels-backward = [ ];
      cycle-windows = [ ];
      cycle-windows-backward = [ ];
      move-to-monitor-down = [ ];
      move-to-monitor-left = [ ];
      move-to-monitor-right = [ ];
      move-to-monitor-up = [ ];
      move-to-workspace-down = [ ];
      move-to-workspace-up = [ ];
      move-to-workspace-left = [ ];
      move-to-workspace-right = [ ];
      move-to-workspace-last = [ ];
      switch-to-workspace-down = [ ];
      switch-to-workspace-up = [ ];
      switch-to-workspace-left = [ ];
      switch-to-workspace-right = [ ];
      switch-to-workspace-last = [ ];
      switch-panels = [ ];
      switch-panels-backward = [ ];
      switch-group = [ ];
      switch-group-backward = [ ];
    };

    "org/gnome/shell/keybindings" = {
      toggle-overview = [ "<Alt>space" ];
      show-screenshot-ui = [ "<Alt><Shift>s" ];

      # Disabled default keybinds
      switch-to-application-1 = [ ];
      switch-to-application-2 = [ ];
      switch-to-application-3 = [ ];
      switch-to-application-4 = [ ];
      switch-to-application-5 = [ ];
      switch-to-application-6 = [ ];
      switch-to-application-7 = [ ];
      switch-to-application-8 = [ ];
      switch-to-application-9 = [ ];
      open-new-window-application-1 = [ ];
      open-new-window-application-2 = [ ];
      open-new-window-application-3 = [ ];
      open-new-window-application-4 = [ ];
      open-new-window-application-5 = [ ];
      open-new-window-application-6 = [ ];
      open-new-window-application-7 = [ ];
      open-new-window-application-8 = [ ];
      open-new-window-application-9 = [ ];
      focus-active-notification = [ ];
      shift-overview-down = [ ];
      shift-overview-up = [ ];
      toggle-application-view = [ ];
      toggle-message-tray = [ ];
      toggle-quick-settings = [ ];
    };

    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = [ "<Alt>Left" ];
      toggle-tiled-right = [ "<Alt>Right" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      screensaver = [ "<Alt>l" ];
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Open Alacritty";
      command = "alacritty";
      binding = "<Alt>Return";
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
      natural-scroll = false;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      natural-scroll = false;
      speed = 0.0;
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "icon-view";
      search-filter-time-type = "last_modified";
      show-hidden-files = true;
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      show-hidden = true;
      sort-directories-first = true;
    };

    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
      sleep-inactive-battery-timeout = 900; # 15 minutes
      power-button-action = "interactive";
    };

    "org/gnome/desktop/privacy" = {
      remember-recent-files = false;
      recent-files-max-age = 30;
      remove-old-trash-files = false;
      remove-old-temp-files = false;
      old-files-age = 30;
    };

    "org/gnome/desktop/session" = {
      idle-delay = lib.hm.gvariant.mkUint32 900; # 15 minutes
    };

    "org/gnome/shell" = {
      favorite-apps = [ ];
      enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
        "blur-my-shell@aunetx"
        "Vitals@CoreCoding.com"
        "clipboard-indicator@tudmotu.com"
        "caffeine@patapon.info"
        "no-overview@fthx"
      ];
    };

    "org/gnome/mutter" = {
      edge-tiling = true;
      dynamic-workspaces = false;
      workspaces-only-on-primary = true;
      overlay-key = "";
    };
  };
}
