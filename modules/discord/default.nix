# modules/discord/default.nix

{ config, pkgs, ... }:

{
  # Permitir la instalación de software no libre
  nixpkgs.config.allowUnfree = true;

  # Instalar Discord con Vencord
  home.packages = with pkgs; [
    (pkgs.discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
    vesktop
  ];

}

