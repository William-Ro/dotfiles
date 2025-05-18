{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    hyprcursor
    hyprshot
    hyprpolkitagent
    swww
    bibata-cursors
  ];
  imports = lib.imports [
    "linux/hyprland/animations"
    "linux/hyprland/binds"
    "linux/hyprland/decorations"
    "linux/hyprland/rules"
    "linux/hyprland/settings"

    "linux/hyprland/hyprlock"
    "linux/hyprland/hypridle"
  ];

  ########################################
  ## Hyprland Window Manager Configuration
  ########################################
  wayland.windowManager.hyprland = {
    enable = true;
  };
}
