{
  config,
  lib,
  pkgs,
  ...
}: {
  services.dunst = {
    enable = true;

    settings = {
      global = {
        rounded = "yes";
        origin = "top-right";
        monitor = "0";
        alignment = "left";
        vertical_alignment = "center";
        width = "400";
        height = "400";
        scale = 0;
        gap_size = 0;
        progress_bar = true;
        transparency = 0;
        text_icon_padding = 0;
        separator_color = "frame";
        sort = "yes";
        idle_threshold = 120;
        line_height = 0;
        markup = "full";
        show_age_threshold = 60;
        ellipsize = "middle";
        ignore_newline = "no";
        stack_duplicates = true;
        sticky_history = "yes";
        history_length = 20;
        always_run_script = true;
        corner_radius = 10;
        follow = "mouse";
        font = "${config.font} 11";
        format = "<b>%s</b>\\n%b"; #format = "<span foreground='#f3f4f5'><b>%s %p</b></span>\n%b"
        frame_color = "#232323";
        frame_width = 1;
        offset = "15x15";
        horizontal_padding = 10;
        icon_position = "left";
        indicate_hidden = "yes";
        min_icon_size = 0;
        max_icon_size = 64;
        mouse_left_click = "do_action, close_current";
        mouse_middle_click = "close_current";
        mouse_right_click = "close_all";
        padding = 10;
        plain_text = "no";
        separator_height = 2;
        show_indicators = "no";
        shrink = "no";
        word_wrap = "yes";
        browser = "/usr/bin/env firefox -new-tab";
      };

      fullscreen_delay_everything = {fullscreen = "delay";};

      urgency_critical = {
        background = "#232323";
        foreground = "#d9e0ee";
      };
      urgency_low = {
        background = "#232323";
        foreground = "#d9e0ee";
      };
      urgency_normal = {
        background = "#232323";
        foreground = "#d9e0ee";
      };
    };
  };
}
