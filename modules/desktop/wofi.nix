{
  config,
  pkgs,
  ...
}: {
  programs.wofi = {
    enable = true;
    settings = {
      # Colores
      colors = {
        normal = {
          background = "#161617";
          foreground = "#c9c7cd";
          selected_background = "#f5a191";
          selected_foreground = "#161617";
        };
        urgent = {
          background = "#e29eca";
          foreground = "#161617";
        };
      };

      # Fuente
      font = {
        family = "JetBrainsMono Nerd Font";
        size = 16.0;
      };

      # Posición y dimensiones de la ventana
      window = {
        position = "center"; # Puede ser "center", "top", "bottom", etc.
        width = "40%"; # Ancho de la ventana
        height = "40%"; # Alto de la ventana
        padding = {
          x = 10;
          y = 10;
        };
      };

      # Transparencia y bordes
      opacity = 0.95; # Ajusta la opacidad de la ventana
      border_width = 3; # Ancho del borde de la ventana
      border_color = "#757581"; # Color del borde de la ventana
    };
  };
}
