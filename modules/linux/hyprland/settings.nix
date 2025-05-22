{
  config,
  lib,
  ...
}: let
  cursorName = "Bibata-Modern-Classic";
  cursorSize = "23";
in {
  wayland.windowManager.hyprland.settings = {
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
      "systemctl --user start hyprpolkitagent"
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
      #kb_variant = "intl";

      # Repeat settings
      repeat_rate = 50;
      repeat_delay = 300;

      # Enable numlock by default
      numlock_by_default = true;

      kb_options = ctrl:nocaps;

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
  };
}
