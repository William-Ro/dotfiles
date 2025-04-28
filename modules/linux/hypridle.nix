{
  pkgs,
  lib,
  config,
  ...
}: let
  timeout = 100;
in {
  home.packages = with pkgs; [
    hypridle
    brillo
  ];
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        before_sleep_cmd = "hyprlock";
        after_sleep_cmd = "hyprctl dispatch dpms on";
        lock_cmd = "hyprlock";
      };

      listener = [
        {
          timeout = timeout - 10;
          on-timeout = "brillo -u 500000 -S 10";
          on-resume = "brillo -I -u 250000";
        }
        {
          timeout = timeout;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = timeout + 10;
          on-timeout = "hyprlock";
        }
      ];
    };
  };
}
