{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.wofi;
in {
  # Habilitar wofi
  options.modules.wofi = {
    enable = mkEnableOption "wofi"; # Habilita la opción
  };

  # Configuración condicional, sólo se aplica si está habilitado
  config = mkIf cfg.enable {
    # Ubicación del archivo CSS para wofi
    home.file.".config/wofi.css".source = ./wofi.css;
  };
}
