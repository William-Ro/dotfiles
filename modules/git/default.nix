# modules/git/default.nix

{ inputs, ... }:

{
  # Configuración mínima para git
  programs.git = {
    enable = true;
    userName = "William-Ro";
    userEmail = "william.rodriguez.rocha@est.una.ac.cr";
  };
}

