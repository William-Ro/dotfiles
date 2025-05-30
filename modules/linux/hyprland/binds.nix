{...}: {
  wayland.windowManager.hyprland.settings = {
    #############################
    ## Key & Mouse Bindings
    #############################
    "$mod" = "ALT";

    # Regular keybindings
    bind = [
      # Window manager
      "$mod SHIFT, E, exec, wlogout"
      "$mod, Q, killactive,"
      "$mod, F, fullscreen,"
      "$mod, G, togglegroup,"
      "$mod, R, togglesplit,"
      "$mod, T, togglefloating,"
      "$mod, P, pseudo,"

      # Move windows
      "$mod SHIFT, left, movewindow, l"
      "$mod SHIFT, right, movewindow, r"
      "$mod SHIFT, up, movewindow, u"
      "$mod SHIFT, down, movewindow, d"

      # Focus movement
      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"

      # Monitor management
      "$mod SHIFT, Y, exec, hyprctl keyword monitor DP-1,preferred,auto,1,transform,1" # 90°
      "$mod SHIFT, U, exec, hyprctl keyword monitor DP-1,preferred,auto,1,transform,2" # 180°
      "$mod SHIFT, I, exec, hyprctl keyword monitor DP-1,preferred,auto,1,transform,3" # 270°
      "$mod SHIFT, O, exec, hyprctl keyword monitor DP-1,preferred,auto,1,transform,0" # Normal

      # Utilities
      "$mod, Return, exec, ghostty"
      "$mod, E, exec, ghostty -e yazi"

      # Screenshots & screen recording
      "$mod SHIFT, S, exec, hyprshot -m region"
      "$mod SHIFT, R, exec, record_screen"
      "$mod SHIFT, L, exec, pidof hyprlock || hyprlock"

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
      "$mod, Space, exec, rofi -show drun"
    ];
    # Mouse bindings
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
      "$mod SUPER, mouse:272, resizewindow"
    ];
    # Media controls
    bindl = [
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    ];

    bindle = [
      # Volume
      ", XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise"
      ", XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"
      ", XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"
      ", XF86AudioMicMute, exec, swayosd-client --input-volume mute-toggle"

      # Brightness
      ", XF86MonBrightnessUp, exec, swayosd-client --brightness raise"
      ", XF86MonBrightnessDown, exec, swayosd-client --brightness lower"

      # Caps Lock
      ", Caps_Lock, exec, swayosd-client --caps-lock"
    ];
  };
}
