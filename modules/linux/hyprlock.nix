{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.hyprlock = {
    enable = true;

    settings = {
      background = [
        {
          monitor = "";
          path = config.wallpaper;

          color = "rgba(25, 20, 20, 1.0)";
          # all these options are taken from hyprland, see https://wiki.hyprland.org/Configuring/Variables/#blur for explanations
          blur_passes = 0; # 0 disables blurring
          blur_size = 2;
          noise = 0;
          contrast = 0;
          brightness = 0;
          vibrancy = 0;
          vibrancy_darkness = 0.0;
        }
      ];

      general = {
        no_fade_in = false;
        grace = 0;
        disable_loading_bar = false;
      };

      input-field = [
        {
          monitor = "";
          size = "250, 40";
          outline_thickness = 2;
          dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.2; # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = true;

          outer_color = "rgba(31, 31, 31, 0.39)";
          inner_color = "rgba(31, 31, 31, 0.39)";
          check_color = "rgba(247, 193, 19, 0.5)";
          font_color = "rgb(217, 224, 238)";
          fade_on_empty = false;
          font_family = "${config.font}";
          placeholder_text = "Enter Password";
          hide_input = false;
          position = "0, -468";
          halign = "center";
          valign = "center";
        }
      ];

      label = [
        # Date
        {
          monitor = "";
          text = "cmd[update:1000] echo \"$(date +\"%A, %d %B\")\"";
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 20;
          font_family = "${config.font}";
          position = "0, 405";
          halign = "center";
          valign = "center";
        }
        # Time
        {
          monitor = "";
          text = "cmd[update:1000] echo \"$(date +\"%I:%M\")\"";
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 93;
          font_family = "${config.font}";
          position = "0, 310";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
