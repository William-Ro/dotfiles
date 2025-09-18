{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.alacritty = {
    enable = true;
    settings = {
      # Fuente
      font = {
        normal = {
          family = "${config.font}";
        };
        size = 22.0;
      };
      # Ventana
      window = {
        padding = {
          x = 12;
          y = 12;
        };
        dynamic_padding = true;
        opacity = 1.0;
        dimensions = {
          columns = 100; # Ancho en columnas de caracteres
          lines = 30; # Alto en líneas de caracteres
        };
      };
    };
  };
}
