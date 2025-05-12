{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: let
  cursorName = "Bibata-Modern-Classic";
  cursorSize = "23";
in {
  home.packages = with pkgs; [
    hyprcursor
    hyprshot
    swww
    bibata-cursors
  ];
  imports = lib.imports [
    "linux/hyprland/binds"
    "linux/hyprland/rules"
  ];

  ########################################
  ## Hyprland Window Manager Configuration
  ########################################
  wayland.windowManager.hyprland = {
    enable = true;
  };
}
