{
  pkgs,
  lib,
  config,
  ...
}: let
  timeout = 600;

  lock = "${pkgs.systemd}/bin/loginctl lock-session";
  brillo = "${pkgs.brillo}/bin/brillo";
  home.packages = with pkgs; [
    hypridle
    brillo
  ];
in {
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        before_sleep_cmd = lock;
        after_sleep_cmd = "hyprctl dispatch dpms on";
        lock_cmd = "pgrep hyprlock || ${pkgs.hyprlock}/bin/hyprlock";
      };

      listener = [
        {
          timeout = timeout - 10;
          on-timeout = "${brillo} -O; ${brillo} -u 500000 -S 10";
          on-resume = "${brillo} -I -u 250000";
        }
        {
          timeout = timeout;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = timeout + 10;
          on-timeout = lock;
        }
      ];
    };
  };
}
