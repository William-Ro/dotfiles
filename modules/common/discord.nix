{pkgs, ...}: {
  home.packages = [
    # Vesktop es una alternativa a Discord que incluye:
    # - OpenAsar por defecto (mejor rendimiento)
    # - Sistema de plugins incorporado (similar a Vencord)
    # - Mejores opciones de personalización
    pkgs.vesktop
  ];
}
