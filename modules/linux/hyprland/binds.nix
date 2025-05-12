{...}: {
  wayland.windowManager.hyprland.settings = {
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
      # Monitor management
      "$mod SHIFT, Y, exec, hyprctl keyword monitor DP-1,preferred,auto,1,transform,1" # 90°
      "$mod SHIFT, U, exec, hyprctl keyword monitor DP-1,preferred,auto,1,transform,2" # 180°
      "$mod SHIFT, I, exec, hyprctl keyword monitor DP-1,preferred,auto,1,transform,3" # 270°
      "$mod SHIFT, O, exec, hyprctl keyword monitor DP-1,preferred,auto,1,transform,0" # Normal

      # Window manager
      "$mod SHIFT, E, exec, wlogout"
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
  };
}
