{
  config,
  pkgs,
  inputs,
  ...
}: let
  # Cursor theme configuration
  cursorName = "Bibata-Modern-Classic";
  cursorSize = "23";
in {
  ########################################
  ## Packages required by Hyprland setup
  ########################################
  home.packages = with pkgs; [
    hyprcursor # For custom cursors
    hyprshot # For taking screenshots
    swww # Wallpaper daemon
    bibata-cursors # Bibata cursor theme
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
      misc.vfr = 0;
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
        "swww init & sleep 0.5 && exec wallpaper_default"
        "pkill waybar & sleep 0.5 && waybar"
        "hyprlock"
        "hypridle"
        "dunst"
      ];

      #############################
      ## General Window Behavior
      #############################
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 1;
        "col.active_border" = "rgba(88888888)";
        "col.inactive_border" = "rgba(00000088)";
        allow_tearing = false;
        resize_on_border = true;
        layout = "dwindle";
      };

      #############################
      ## Window Decorations
      #############################
      decoration = {
        rounding = 10;
        rounding_power = 3;
        blur = {
          enabled = true;
          brightness = 1.0;
          contrast = 1.0;
          noise = 0.01;
          vibrancy = 0.2;
          vibrancy_darkness = 0.5;
          passes = 4;
          size = 7;
          popups = true;
          popups_ignorealpha = 0.2;
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
        force_no_accel = true;
        follow_mouse = 1;
        accel_profile = "flat";
        sensitivity = 0;
        tablet.output = "current";
      };

      #############################
      ## Dwindle Tiling Layout
      #############################
      dwindle = {
        pseudotile = true; # Retain floating dimensions
        preserve_split = true;
      };

      #############################
      ## Miscellaneous Settings
      #############################
      misc = {
        disable_autoreload = true; # Disable auto-reloading of config
        animate_mouse_windowdragging = true;
      };

      #############################
      ## Touchpad Gestures
      #############################
      gestures = {
        workspace_swipe = true;
        workspace_swipe_forever = true;
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
      ## Key & Mouse Bindings
      #############################
      "$mod" = "ALT";

      # Mouse bindings
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod SUPER, mouse:272, resizewindow"
      ];

      # Regular keybindings
      bind = [
        # Window manager
        "$mod SHIFT, E, exec, pkill Hyprland"
        "$mod, Q, killactive,"
        "$mod, F, fullscreen,"
        "$mod, G, togglegroup,"
        "$mod SHIFT, N, changegroupactive, f"
        "$mod SHIFT, P, changegroupactive, b"
        "$mod, R, togglesplit,"
        "$mod, T, togglefloating,"
        "$mod, P, pseudo,"

        # Move windows
        "$mod SHIFT, left, movewindow, l"
        "$mod SHIFT, right, movewindow, r"
        "$mod SHIFT, up, movewindow, u"
        "$mod SHIFT, down, movewindow, d"

        # Utilities
        "$mod, Return, exec, ghostty"
        "$mod, E, exec, ghostty -e yazi"

        # Focus movement
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        # Screenshots & screen recording
        "$mod SHIFT, S, exec, hyprshot -m region"
        "$mod SHIFT, R, exec, record_screen"
        "$mod SHIFT, L, exec, hyprlock"

        # Workspace switching
        "$mod, bracketleft, workspace, m-1"
        "$mod, bracketright, workspace, m+1"

        # Monitor focus
        "$mod SHIFT, bracketleft, focusmonitor, l"
        "$mod SHIFT, bracketright, focusmonitor, r"

        # Move workspace between monitors
        "$mod SHIFT SUPER, bracketleft, movecurrentworkspacetomonitor, l"
        "$mod SHIFT SUPER, bracketright, movecurrentworkspacetomonitor, r"

        # Workspace keys (1-9)
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"

        # Move windows to workspaces
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
      ];

      # Launcher (wofi)
      bindr = [
        "$mod, Space, exec, wofi -H 400 -W 700 --show drun"
      ];

      # Media controls
      bindl = [
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ];

      # Volume and brightness controls
      bindle = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%-"
        ", XF86MonBrightnessUp, exec, brillo -q -u 300000 -A 5"
        ", XF86MonBrightnessDown, exec, brillo -q -u 300000 -U 5"
      ];

      #############################
      ## Window Rules
      #############################
      windowrulev2 = [
        # Floating windows
        "float, title:^(Media viewer)$"
        "float, title:^(Open Files)$"
        "center, title:^(Open Files)$"
        "float, title:^(File Upload)$"
        "center, title:^(File Upload)$"
        "float, title:^(Save Image)$"
        "center, title:^(Save Image)$"

        # Calculator
        "float, class:^(org.gnome.Calculator)$"
        "size 360 490, class:^(org.gnome.Calculator)$"

        # Picture-in-Picture windows
        "float, title:^(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"

        # Sharing indicators to special workspace
        "workspace special silent, title:^(Firefox — Sharing Indicator)$"
        "workspace special silent, title:^(Zen — Sharing Indicator)$"
        "workspace special silent, title:^(.*is sharing (your screen|a window)\.)$"

        # Idle inhibition for video players
        "idleinhibit focus, class:^(mpv|.+exe|celluloid)$"
        "idleinhibit focus, class:^(zen)$, title:^(.*YouTube.*)$"
        "idleinhibit fullscreen, class:^(zen)$"

        # Dimming prompts
        "dimaround, class:^(gcr-prompter)$"
        "dimaround, class:^(xdg-desktop-portal-gtk)$"
        "dimaround, class:^(polkit-gnome-authentication-agent-1)$"
        "dimaround, class:^(zen)$, title:^(File Upload)$"

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
