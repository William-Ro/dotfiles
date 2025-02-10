{
  config,
  pkgs,
  ...
}: {
  # Configuración mínima para Fastfetch
  programs.fastfetch = {
    enable = true;
  };
}
