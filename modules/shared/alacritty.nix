{
  config,
  pkgs,
  ...
}: {
  programs.alacritty = {
    enable = true;
    settings = {
      # Colores
      colors = {
        primary = {
          background = "#161617";
          foreground = "#c9c7cd";
        };
        cursor = {
          text = "#c9c7cd";
          cursor = "#757581";
        };
        normal = {
          black = "#27272a";
          red = "#f5a191";
          green = "#90b99f";
          yellow = "#e6b99d";
          blue = "#aca1cf";
          magenta = "#e29eca";
          cyan = "#ea83a5";
          white = "#c1c0d4";
        };
        bright = {
          black = "#353539";
          red = "#ffae9f";
          green = "#9dc6ac";
          yellow = "#f0c5a9";
          blue = "#b9aeda";
          magenta = "#ecaad6";
          cyan = "#f591b2";
          white = "#cac9dd";
        };
      };
      # Fuente
      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
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
