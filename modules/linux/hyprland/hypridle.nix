{
  pkgs,
  lib,
  config,
  ...
}: let
  home.packages = with pkgs; [
    hypridle
    brightnessctl
  ];
in {
  services.hypridle = {
    enable = true;

    settings = {
      # General settings and commands to execute at different states
      general = {
        lock_cmd = "pidof hyprlock || hyprlock"; # avoid starting multiple hyprlock instances.
        before_sleep_cmd = "loginctl lock-session"; # lock before suspend.
        after_sleep_cmd = "hyprctl dispatch dpms on"; # to avoid having to press a key twice to turn on the display.
      };

      listener = [
        # Dim screen after 2.5 minutes of inactivity
        {
          timeout = 150; # 2.5min.
          on-timeout = "brightnessctl - s set 10"; # set monitor backlight to minimum, avoid 0 on OLED monitor.
          on-resume = "brightnessctl - r"; # monitor backlight restore.
        }
        # Lock screen after 5 minutes of inactivity
        {
          timeout = 300; # 5min
          on-timeout = "loginctl lock-session"; # lock screen when timeout has passed
        }
        # Turn off display after 5.5 minutes
        {
          timeout = 330; # 5.5min
          on-timeout = "hyprctl dispatch dpms off"; # screen off when timeout has passed
          on-resume = "hyprctl dispatch dpms on"; # screen on when activity is detected after timeout has fired.
        }
      ];
    };
  };
}
