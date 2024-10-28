# modules/default.nix

# Importar los módulos de git y fastfetch
let
  git = import ./git/default.nix;
  fastfetch = import ./fastfetch/default.nix;
  hyprland = import ./hyprland/default.nix;
  kitty = import ./kitty/default.nix;
  discord = import ./discord/default.nix;
  waybar = import ./waybar/default.nix;
  vscode = import ./vscode/default.nix;
  lsd = import ./lsd/default.nix;
in
  # Combinar los módulos para que puedas importarlos como uno solo
  { config, pkgs, ... }:
    {
      # Extender la configuración usando los módulos importados
      imports = [
        git
        fastfetch
	hyprland
	kitty
	discord
	waybar
	vscode
	lsd
      ];
    }
