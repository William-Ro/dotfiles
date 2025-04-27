{
  config,
  inputs,
  pkgs,
  lib,
  ...
}: {
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        disable_loading_bar = true;
        immediate_render = true;
        hide_cursor = false;
        no_fade_in = true;
      };

      animation = "inputFieldDots, 1, 2, linear";

      background = [
        {
          monitor = "";
          path = config.wallpaperPath;
        }
      ];

      input-field = [
        {
          monitor = "DP-1";

          size = "300, 50";
          valign = "bottom";
          position = "0%, 10%";

          outline_thickness = 2;

          font_family = "JetBrainsMono Nerd Font";
          font_color = "rgb(217, 224, 238)";
          outer_color = "rgba(31, 31, 31, 0.39)";
          inner_color = "rgba(31, 31, 31, 0.39)";
          check_color = "rgba(247, 193, 19, 0.5)";
          fail_color = "rgba(255, 106, 134, 0.5)";

          fade_on_empty = false;
          placeholder_text = "Password";

          dots_spacing = 0.2;
          dots_center = true;
          dots_fade_time = 100;
        }
      ];

      label = [
        {
          monitor = "";
          text = "cmd[update:3600000] LANG=en_US.UTF-8 date +'%I:%M'";
          font_size = 120;
          color = "rgb(217, 224, 238)";
          font_family = "JetBrainsMono Nerd Font";
          position = "0%, 30%";

          valign = "center";
          halign = "center";

          shadow_color = "rgba(0, 0, 0, 0.1)";
          shadow_size = 20;
          shadow_passes = 2;
          shadow_boost = 0.3;
        }
        {
          monitor = "";
          text = "cmd[update:3600000] LANG=en_US.UTF-8 date +'%A %b %d'";
          font_size = 20;
          color = "rgb(217, 224, 238)";
          font_family = "JetBrainsMono Nerd Font";
          position = "0%, 40%";

          valign = "center";
          halign = "center";

          shadow_color = "rgba(0, 0, 0, 0.1)";
          shadow_size = 20;
          shadow_passes = 2;
          shadow_boost = 0.3;
        }
      ];
    };
  };
}
