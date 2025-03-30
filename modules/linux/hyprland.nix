{
  config,
  pkgs,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      env = [
        "NIXOS_OZONE_WL, 1"
        "NIXPKGS_ALLOW_UNFREE, 1"
        "WLR_NO_HARDWARE_CURSORS, 1"
        "EDITOR,nvim"
      ];
    };
  };
}
