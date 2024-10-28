{ inputs, pkgs, ... }:

{
  # Habilitar el gestor de ventanas Hyprland
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

    settings = {

      # Desactivar la aceleración del mouse
      "input:accel_profile" = "flat";
      
      # Definir el modificador de teclado
      "$mod" = "SUPER";

      # Definición de bindings de teclas
      bind = [
      # Comandos básicos
      "$mod, Q, exec, kitty"
      "$mod, E, exec, dolphin"
      "$mod, R, exec, wofi --show drun"
      "$mod, F, exec, firefox"
      "$mod, Print, exec, grimblast copy area"

      # Nueva configuración de keybindings
      "$mod, C, killactive,"
      "$mod, M, exit,"
      "$mod, V, togglefloating,"
      "$mod, P, pseudo," # dwindle
      "$mod, J, togglesplit," # dwindle

      # Movimiento de enfoque con las teclas de dirección
      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"

      # Cambiar de workspace
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"
      "$mod, 0, workspace, 10"

      # Mover la ventana activa a un workspace
      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"
      "$mod SHIFT, 5, movetoworkspace, 5"
      "$mod SHIFT, 6, movetoworkspace, 6"
      "$mod SHIFT, 7, movetoworkspace, 7"
      "$mod SHIFT, 8, movetoworkspace, 8"
      "$mod SHIFT, 9, movetoworkspace, 9"
      "$mod SHIFT, 0, movetoworkspace, 1"
    ];
    };

    # Ejemplo de uso de plugins (opcional)
    plugins = [
      # "/absolute/path/to/plugin.so"
    ];
  };

  # Instalar aplicaciones necesarias
  home.packages = with pkgs; [
    dolphin
    wofi
  ];
}

