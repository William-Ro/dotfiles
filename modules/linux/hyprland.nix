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
    hyprcursor # Cursor theme
    hyprshot # Screenshots
    swww # Wallpaper manager
    bibata-cursors # Cursor theme
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      env = [
        # Force all applications to use Wayland
        # Source: https://wiki.hyprland.org/Getting-Started/Master-Tutorial/#force-apps-to-use-wayland
        "NIXOS_OZONE_WL,1"
        # Flickering in Electron / CEF apps
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        # Cursor
        "HYPRCURSOR_THEME,${cursorName}"
        "HYPRCURSOR_SIZE,${cursorSize}"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "HYPRSHOT_DIR,${config.screenshots}"
      ];
      ####################
      #### Settings ######
      ####################

      monitor = [
        # name, resolution, scale, rotation
        "DP-1,2560x1440@165,0x0,1"
      ];

      exec-once = [
        "hyprctl setcursor ${cursorName} ${cursorSize}"
        "swww init & sleep 0.5 && exec wallpaper_default"
        "pkill waybar & sleep 0.5 && waybar"
        "hyprlock"
        "hypridle"
        "dunst"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 1;
        "col.active_border" = "rgba(88888888)";
        "col.inactive_border" = "rgba(00000088)";
        allow_tearing = true;
        resize_on_border = true;
        layout = "dwindle";
      };
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
      animations = {
        enabled = true;
        animation = [
          "border, 1, 2, default"
          "fade, 1, 4, default"
          "windows, 1, 3, default, popin 80%"
          "workspaces, 1, 2, default, slide"
        ];
      };

      group = {
        groupbar = {
          font_size = 13;
          gradients = false;
          text_color = "rgb(b6c4ff)";
        };

        "col.border_active" = "rgba(35447988)";
        "col.border_inactive" = "rgba(dce1ff88)";
      };
      input = {
        kb_layout = "us";

        # focus change on cursor move
        force_no_accel = true;
        follow_mouse = 1;
        accel_profile = "flat";
        sensitivity = 0;
        tablet.output = "current";
      };
      dwindle = {
        # keep floating dimentions while tiling
        pseudotile = true;
        preserve_split = true;
      };

      misc = {
        # disable auto polling for config file changes
        disable_autoreload = true;

        animate_mouse_windowdragging = true;
      };

      # touchpad gestures
      gestures = {
        workspace_swipe = true;
        workspace_swipe_forever = true;
      };
      xwayland.force_zero_scaling = true;

      debug.disable_logs = false;
      # This is a temporary fix for the flickering issue in some apps
      debug.damage_tracking = 0;

      #######################
      ##### Binds.nix #######
      #######################
      "$mod" = "ALT";
      # mouse movements
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod SUPER, mouse:272, resizewindow"
      ];
      # binds
      bind = [
        # compositor commands
        "$mod SHIFT, E, exec, pkill Hyprland"
        "$mod, Q, killactive,"
        "$mod, F, fullscreen,"
        "$mod, G, togglegroup,"
        "$mod SHIFT, N, changegroupactive, f"
        "$mod SHIFT, P, changegroupactive, b"
        "$mod, R, togglesplit,"
        "$mod, T, togglefloating,"
        "$mod, P, pseudo,"

        # utility
        # terminal
        "$mod, Return, exec, ghostty"

        "$mod, E, exec, ghostty -e yazi"

        # move focus
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        # Screenshot a region
        "$mod SHIFT, S, exec, hyprshot -m region"

        # record
        "$mod SHIFT, R, exec, record_screen"

        # hyprlock
        "$mod SHIFT, L, exec, hyprlock"

        # cycle workspaces
        "$mod, bracketleft, workspace, m-1"
        "$mod, bracketright, workspace, m+1"

        # cycle monitors
        "$mod SHIFT, bracketleft, focusmonitor, l"
        "$mod SHIFT, bracketright, focusmonitor, r"

        # send focused workspace to left/right monitors
        "$mod SHIFT SUPER, bracketleft, movecurrentworkspacetomonitor, l"
        "$mod SHIFT SUPER, bracketright, movecurrentworkspacetomonitor, r"

        # switch workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"

        # move active window to workspace
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

      bindr = [
        # launcher
        "$mod, Space, exec, wofi -H 400 -W 700 --show drun"
      ];

      bindl = [
        # media controls
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioNext, exec, playerctl next"

        # volume
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ];

      bindle = [
        # volume
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%-"

        # backlight
        ", XF86MonBrightnessUp, exec, brillo -q -u 300000 -A 5"
        ", XF86MonBrightnessDown, exec, brillo -q -u 300000 -U 5"
      ];

      ###########
      ###Rules###
      ###########

      # window rules
      windowrulev2 = [
        # telegram media viewer
        "float, title:^(Media viewer)$"

        # file picker
        "float, title:^(Open Files)$"
        "center, title:^(Open Files)$"

        "float, title:^(File Upload)$"
        "center, title:^(File Upload)$"

        "float, title:^(Save Image)$"
        "center, title:^(Save Image)$"

        # gnome calculator
        "float, class:^(org.gnome.Calculator)$"
        "size 360 490, class:^(org.gnome.Calculator)$"

        # make Firefox/Zen PiP window floating and sticky
        "float, title:^(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"

        # throw sharing indicators away
        "workspace special silent, title:^(Firefox — Sharing Indicator)$"
        "workspace special silent, title:^(Zen — Sharing Indicator)$"
        "workspace special silent, title:^(.*is sharing (your screen|a window)\.)$"

        # idle inhibit while watching videos
        "idleinhibit focus, class:^(mpv|.+exe|celluloid)$"
        "idleinhibit focus, class:^(zen)$, title:^(.*YouTube.*)$"
        "idleinhibit fullscreen, class:^(zen)$"

        "dimaround, class:^(gcr-prompter)$"
        "dimaround, class:^(xdg-desktop-portal-gtk)$"
        "dimaround, class:^(polkit-gnome-authentication-agent-1)$"
        "dimaround, class:^(zen)$, title:^(File Upload)$"

        # fix xwayland apps
        "rounding 0, xwayland:1"
        "center, class:^(.*jetbrains.*)$, title:^(Confirm Exit|Open Project|win424|win201|splash)$"
        "size 640 400, class:^(.*jetbrains.*)$, title:^(splash)$"

        # less sensitive scroll for some windows
        # browser(-based)
        "scrolltouchpad 0.1, class:^(zen|firefox|chromium-browser|chrome-.*)$"
        "scrolltouchpad 0.1, class:^(obsidian)$"
        # GTK3
        "scrolltouchpad 0.1, class:^(com.github.xournalpp.xournalpp)$"
        "scrolltouchpad 0.1, class:^(libreoffice.*)$"
        "scrolltouchpad 0.1, class:^(.virt-manager-wrapped)$"
        "scrolltouchpad 0.1, class:^(xdg-desktop-portal-gtk)$"
        # Qt5
        "scrolltouchpad 0.1, class:^(org.prismlauncher.PrismLauncher)$"
        "scrolltouchpad 0.1, class:^(org.kde.kdeconnect.app)$"
        # Others
        "scrolltouchpad 0.1, class:^(org.pwmt.zathura)$"
      ];
    };
  };
}
