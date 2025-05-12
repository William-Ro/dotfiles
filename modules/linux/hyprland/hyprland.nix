{
  config,
  pkgs,
  inputs,
  ...
}: let
  cursorName = "Bibata-Modern-Classic";
  cursorSize = "23";
in {
  home.packages = with pkgs; [
    hyprcursor
    hyprshot
    swww
    bibata-cursors
  ];

  ########################################
  ## Hyprland Window Manager Configuration
  ########################################
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      #############################
      ## Nvidia Temporary Fixes
      #############################
      render.explicit_sync = 2;
      render.explicit_sync_kms = 0;
      opengl.nvidia_anti_flicker = 0;
      debug.damage_tracking = 0;

      #############################
      ## Environment Variables
      #############################
      env = [
        "NIXOS_OZONE_WL,1" # Force apps to use Wayland
        "HYPRCURSOR_THEME,${cursorName}" # Cursor theme
        "HYPRCURSOR_SIZE,${cursorSize}" # Cursor size
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1" # Disable Qt window decorations
        "HYPRSHOT_DIR,${config.screenshots}" # Custom screenshot directory
      ];

      #############################
      ## Display / Monitor Setup
      #############################
      monitor = [
        # Format: name, resolution@refresh rate, position, scale
        "DP-1,2560x1440@165,0x0,1"
      ];

      #############################
      ## Autostart Applications
      #############################
      exec-once = [
        "hyprctl setcursor ${cursorName} ${cursorSize}"
        "swww init & sleep 0.5"
        "pkill waybar & sleep 0.5 && waybar"
        "hyprlock"
        "hypridle"
        "dunst"
      ];

      #############################
      ## General Window Behavior
      #############################
      general = {
        gaps_in = 10;
        gaps_out = 10;
        gaps_workspaces = 0;
        border_size = 0;
        "col.active_border" = "rgba(88888888)";
        "col.inactive_border" = "rgba(00000088)";
        resize_on_border = true;
        layout = "dwindle";
      };
      #############################
      ## Dwindle Tiling Layout
      #############################
      dwindle = {
        # Enable pseudotiling (resize windows while keeping tiled layout)
        pseudotile = true;
        # Enable preserve_split to maintain split direction when closing windows
        preserve_split = true;

        # Force split direction (0 = based on dimensions, 1 = always horizontal, 2 = always vertical)
        force_split = 0;
        # Use smart resizing for windows
        smart_split = false;
        smart_resizing = true;
        # Use permanent direction for splits
        permanent_direction_override = false;
      };

      #############################
      ## Window Decorations
      #############################
      decoration = {
        rounding = 10;
        rounding_power = 3;
        active_opacity = 1.0; # Opacity of the active (focused) window
        inactive_opacity = 1.0; # Opacity of inactive windows
        fullscreen_opacity = 1.0; # Opacity of fullscreen windows
        dim_inactive = false; # Whether to dim inactive windows
        dim_strength = 0.1; # How much to dim inactive windows (0.0 - 1.0)
        dim_special = 0.2; # How much to dim special windows (0.0 - 1.0)
        dim_around = 0.4; # How much to dim the screen around fullscreen windows

        blur = {
          enabled = true;
          xray = true;
          size = 7;
          vibrancy_darkness = 0.5;
          passes = 4;
          vibrancy = 0.1796;
        };

        shadow = {
          enabled = true;
          color = "rgba(00000055)";
          ignore_window = true;
          offset = "0 15";
          range = 100;
          render_power = 2;
          scale = 0.97;
        };
      };

      #############################
      ## Animations
      #############################
      animations = {
        enabled = true;
        animation = [
          "windows, 1, 3, md3_decel, popin 60%:"
          "windowsIn, 1, 3, md3_decel, popin 60%"
          "windowsOut, 1, 3, md3_accel, popin 60%"
          "border, 1, 10, default"
          "fade, 1, 3, md3_decel"
          "layers, 1, 2, md3_decel, slide"
          "layersIn, 1, 3, menu_decel, slide"
          "layersOut, 1, 1.6, menu_accel"
          "fadeLayersIn, 1, 2, menu_decel"
          "fadeLayersOut, 1, 4.5, menu_accel"
          "workspaces, 1, 7, menu_decel, slide"
          "workspaces, 1, 2.5, softAcDecel, slide"
          "workspaces, 1, 7, menu_decel, slidefade 15%"
          "specialWorkspace, 1, 3, md3_decel, slidefadevert 15%"
          "specialWorkspace, 1, 3, md3_decel, slidevert"
        ];
        bezier = [
          "linear, 0, 0, 1, 1"
          "md3_standard, 0.2, 0, 0, 1"
          "md3_decel, 0.05, 0.7, 0.1, 1"
          "md3_accel, 0.3, 0, 0.8, 0.15"
          "overshot, 0.05, 0.9, 0.1, 1.1"
          "crazyshot, 0.1, 1.5, 0.76, 0.92"
          "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
          "menu_decel, 0.1, 1, 0, 1"
          "menu_accel, 0.38, 0.04, 1, 0.07"
          "easeInOutCirc, 0.85, 0, 0.15, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutExpo, 0.16, 1, 0.3, 1"
          "softAcDecel, 0.26, 0.26, 0.15, 1"
          "md2, 0.4, 0, 0.2, 1"
        ];
      };
      #############################
      ## Grouping Settings
      #############################
      group = {
        groupbar = {
          font_size = 13;
          gradients = false;
          text_color = "rgb(b6c4ff)";
        };
        "col.border_active" = "rgba(35447988)";
        "col.border_inactive" = "rgba(dce1ff88)";
      };

      #############################
      ## Input Devices
      #############################
      input = {
        kb_layout = "us";

        # Repeat settings
        repeat_rate = 50;
        repeat_delay = 300;

        # Enable numlock by default
        numlock_by_default = true;

        # Disable mousewheel on inactive windows
        follow_mouse = 1;

        # Cursor position: center of new window
        force_no_accel = 0;

        # Mouse sensitivity (relative to what you're used to)
        sensitivity = 0.0;
        accel_profile = "flat";

        special_fallthrough = true;
        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
          tap-to-click = true;
          drag_lock = true;
          # Scrolling speed with two fingers
          scroll_factor = 0.5;
        };
      };
      #############################
      ## Touchpad Gestures
      #############################
      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_distance = 300;
        workspace_swipe_invert = false;
        workspace_swipe_min_speed_to_force = 30;
        workspace_swipe_cancel_ratio = 0.5;
        workspace_swipe_create_new = true;
        workspace_swipe_forever = false;
      };

      #############################
      ## Miscellaneous Settings
      #############################
      misc = {
        disable_autoreload = true; # Disable auto-reloading of config
        vfr = 0;
        vrr = 0;
        animate_manual_resizes = false;
        animate_mouse_windowdragging = false;
        enable_swallow = false;
        focus_on_activate = true; # Test
        render_ahead_of_time = true;
        render_ahead_safezone = 30;
        # disable_scale_checks = true
        disable_hyprland_logo = true;
        force_default_wallpaper = 0;
        disable_splash_rendering = true;
        # new_window_takes_over_fullscreen = 2
        allow_session_lock_restore = true;
        initial_workspace_tracking = true;
      };

      #############################
      ## XWayland Settings
      #############################
      xwayland.force_zero_scaling = true;

      #############################
      ## Debugging
      #############################
      debug.disable_logs = false;

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

        # Idle inhibition for video players
        "idleinhibit focus, class:^(mpv|.+exe|celluloid)$"
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
  };
}
