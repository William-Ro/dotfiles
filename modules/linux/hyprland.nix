{
  config,
  pkgs,
  inputs,
  ...
}: let
  # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
  workspaces = builtins.concatLists (builtins.genList (
      x: let
        ws = toString (x + 1); # Genera directamente el número del workspace
      in [
        "$mod, ${ws}, workspace, ${ws}"
        "$mod SHIFT, ${ws}, movetoworkspace, ${ws}"
      ]
    )
    9);

  toggle = program: let
    prog = builtins.substring 0 14 program;
  in "pkill ${prog} || uwsm app -- ${program}";

  runOnce = program: "pgrep ${program} || uwsm app -- ${program}";
in {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      #######################
      #### Settings.nix #####
      #######################

      env = [
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "WLR_NO_HARDWARE_CURSORS,1"
        "NIXOS_OZONE_WL,1"
        "EDITOR,nvim"
      ];

      exec-once = [
        # finalize startup
        "uwsm finalize"
        # set cursor for HL itself
        "hyprlock"
      ];
      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 1;
        "col.active_border" = "rgba(88888888)";
        "col.inactive_border" = "rgba(00000088)";

        allow_tearing = true;
        resize_on_border = true;
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
        follow_mouse = 1;
        accel_profile = "flat";
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

        force_default_wallpaper = 0;

        # disable dragging animation
        animate_mouse_windowdragging = false;

        # enable variable refresh rate (effective depending on hardware)
        vrr = 1;
      };
      render = {
        direct_scanout = true;
        # Fixes some apps stuttering (xournalpp, hyprlock). Possibly an amdgpu bug
        explicit_sync = 0;
        explicit_sync_kms = 0;
      };

      # touchpad gestures
      gestures = {
        workspace_swipe = true;
        workspace_swipe_forever = true;
      };
      xwayland.force_zero_scaling = true;

      debug.disable_logs = false;
      debug.damage_tracking = 0;

      plugin = {
        csgo-vulkan-fix = {
          res_w = 1280;
          res_h = 800;
          class = "cs2";
        };

        hyprbars = {
          bar_height = 20;
          bar_precedence_over_border = true;

          # order is right-to-left
          hyprbars-button = [
            # close
            "rgb(ffb4ab), 15, , hyprctl dispatch killactive"
            # maximize
            "rgb(b6c4ff), 15, , hyprctl dispatch fullscreen 1"
          ];
        };

        hyprexpo = {
          columns = 3;
          gap_size = 4;
          bg_col = "rgb(000000)";

          enable_gesture = true;
          gesture_distance = 300;
          gesture_positive = false;
        };
      };

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
      bind =
        [
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
          "$mod SUPER, ,resizeactive,"

          # utility
          # terminal
          "$mod, Return, exec, uwsm app -- ghostty"
          # logout menu
          "$mod, Escape, exec, ${toggle "wlogout"} -p layer-shell"
          # lock screen
          "$mod, L, exec, ${runOnce "hyprlock"}"
          # lock screen, to be used with the special key Fn+F10 on my keyboard
          "$mod, I, exec, ${runOnce "hyprlock"}"
          # select area to perform OCR on
          "$mod, O, exec, ${runOnce "wl-ocr"}"
          ", XF86Favorites, exec, ${runOnce "wl-ocr"}"
          # open calculator
          ", XF86Calculator, exec, ${toggle "gnome-calculator"}"
          # open settings
          "$mod, U, exec, XDG_CURRENT_DESKTOP=gnome ${runOnce "gnome-control-center"}"

          # move focus
          "$mod, left, movefocus, l"
          "$mod, right, movefocus, r"
          "$mod, up, movefocus, u"
          "$mod, down, movefocus, d"

          # screenshot
          # area
          ", Print, exec, ${runOnce "grimblast"} --notify copysave area"
          "$mod SHIFT, S, exec, ${runOnce "grimblast"} --notify copysave area"

          # current screen
          "CTRL, Print, exec, ${runOnce "grimblast"} --notify --cursor copysave output"
          "$mod SHIFT CTRL, R, exec, ${runOnce "grimblast"} --notify --cursor copysave output"

          # all screens
          "SUPER, Print, exec, ${runOnce "grimblast"} --notify --cursor copysave screen"
          "$mod SHIFT SUPER, R, exec, ${runOnce "grimblast"} --notify --cursor copysave screen"

          # special workspace
          "$mod SHIFT, grave, movetoworkspace, special"
          "$mod, grave, togglespecialworkspace, eDP-1"

          # cycle workspaces
          "$mod, bracketleft, workspace, m-1"
          "$mod, bracketright, workspace, m+1"

          # cycle monitors
          "$mod SHIFT, bracketleft, focusmonitor, l"
          "$mod SHIFT, bracketright, focusmonitor, r"

          # send focused workspace to left/right monitors
          "$mod SHIFT SUPER, bracketleft, movecurrentworkspacetomonitor, l"
          "$mod SHIFT SUPER, bracketright, movecurrentworkspacetomonitor, r"
        ]
        ++ workspaces;

      bindr = [
        # launcher
        "$mod, Space, exec, ${toggle "wofi --show drun"}"
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

        # Bitwarden extension
        "float, title:^(.*Bitwarden Password Manager.*)$"

        # gnome calculator
        "float, class:^(org.gnome.Calculator)$"
        "size 360 490, class:^(org.gnome.Calculator)$"

        # allow tearing in games
        "immediate, class:^(osu\!|cs2)$"

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

        # don't render hyprbars on tiling windows
        "plugin:hyprbars:nobar, floating:0"

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
