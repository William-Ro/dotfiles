{...}: {
  wayland.windowManager.hyprland.settings = {
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
  };
}
