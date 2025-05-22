{...}: {
  wayland.windowManager.hyprland.settings = {
    #############################
    ## Window Rules
    #############################
    windowrulev2 = [
      # Make sure all notifications are floating
      "float, class:^(dunst)$"
      "float, class:^(wired-notify)$"

      # File pickers and dialogs
      "float, title:^(Save As)$"
      "float, title:^(Open File)$"
      "size 50% 50%, title:^(Open File)$"
      "center, title:^(Open File)$"
      "float, title:^(File Upload)$"
      "center, title:^(File Upload)$"

      # Make sure all file upload dialogs are floating
      "float, title:^(Open Files)$"
      "center, title:^(Open Files)$"
      "float, title:^(File Upload)$"
      "center, title:^(File Upload)$"
      "float, title:^(Save Image)$"
      "center, title:^(Save Image)$"

      # Make image viewer floating with specific size
      "float, class:^(imv)$"
      "size 75% 75%, class:^(imv)$"
      "center, class:^(imv)$"

      # Video players
      "float, class:^(mpv)$"
      "size 70% 70%, class:^(mpv)$"
      "center, class:^(mpv)$"

      # Force Steam games to be fullscreen
      "fullscreen, class:^(steam_app_)"

      # Disable idle when gaming
      "idleinhibit always, class:^(steam_app_)"
      "idleinhibit always, class:^(gamescope)$"

      # Calculator
      "float, class:^(org.gnome.Calculator)$"
      "size 360 490, class:^(org.gnome.Calculator)$"

      # Nautilus
      "float, class:^(org.gnome.Nautilus)$"
      "size 50% 50%, class:^(org.gnome.Nautilus)$"

      # Picture-in-Picture windows
      "float, title:^(Picture-in-Picture)$"
      "pin, title:^(Picture-in-Picture)$"

      # Sharing indicators to special workspace
      "workspace special silent, title:^(Firefox — Sharing Indicator)$"
      "workspace special silent, title:^(Zen — Sharing Indicator)$"
      "workspace special silent, title:^(.*is sharing (your screen|a window)\.)$"

      # Idle inhibition
      "idleinhibit focus, class:^(mpv|.+exe|celluloid)$"
      "idleinhibit focus, class:^(imv)$"
      "idleinhibit focus, class:^(spotify)$"

      "idleinhibit focus, class:^(firefox)$, title:^(.*YouTube.*)$"
      "idleinhibit fullscreen, class:^(firefox)$"

      # Dimming prompts
      "dimaround, class:^(gcr-prompter)$"
      "dimaround, class:^(xdg-desktop-portal-gtk)$"
      "dimaround, class:^(polkit-gnome-authentication-agent-1)$"
      "dimaround, class:^(firefox)$, title:^(File Upload)$"

      # XWayland fixes
      "rounding 0, xwayland:1"
      "center, class:^(.*jetbrains.*)$, title:^(Confirm Exit|Open Project|win424|win201|splash)$"
      "size 640 400, class:^(.*jetbrains.*)$, title:^(splash)$"

      # Scroll sensitivity
      "scrolltouchpad 0.1, class:^(zen|firefox|chromium-browser|chrome-.*)$"
      "scrolltouchpad 0.1, class:^(obsidian)$"
    ];
  };
}
