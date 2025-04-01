{
  config,
  lib,
  pkgs,
  ...
}: let
  wallpaper_random = pkgs.writeShellScriptBin "wallpaper_random" ''
    if command -v swww >/dev/null 2>&1; then
        pkill -f dynamic_wallpaper || true
        WALLPAPER=$(find ~/Pictures/wallpapers -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.webp" \) | shuf -n1)

        if [ -n "$WALLPAPER" ]; then
            echo "Setting wallpaper: $WALLPAPER"
            swww img "$WALLPAPER" --transition-type simple
        else
            echo "No images found in ~/Pictures/wallpapers/"
        fi
    else
        echo "swww is not installed or running."
    fi
  '';

  wallpaper_default = pkgs.writeShellScriptBin "wallpaper_default" ''
    if command -v swww >/dev/null 2>&1; then
          swww img ~/Pictures/wallpapers/menhera.jpg  --transition-type simple
    fi
  '';
in {
  home.packages = with pkgs; [
    wallpaper_random
    wallpaper_default
  ];
}
