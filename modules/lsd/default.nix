# modules/lsd/default.nix

{ inputs, ... }:

{
  # Configuración para lsd (LSDeluxe)
  programs.lsd = {
    enable = true;  # Habilita lsd
  };
}

