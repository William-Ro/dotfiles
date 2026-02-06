{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "${config.font}";
        };
        size = 22.0;
      };
      window = {
        padding = {
          x = 12;
          y = 12;
        };
        dynamic_padding = true;
        opacity = 1.0;
        dimensions = {
          columns = 100;
          lines = 30;
        };
      };
    };
  };
}
