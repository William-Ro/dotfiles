{
  config,
  lib,
  pkgs,
  ...
}: let
  wallpaper_random = pkgs.writeShellScriptBin "wallpaper_random" ''
    if command -v swww >/dev/null 2>&1; then
        pkill -f dynamic_wallpaper || true

        WALLPAPER_LINK="${config.wallpaper}"
        WALLPAPER_DIR=$(dirname "$WALLPAPER_LINK")

        CURRENT_WALLPAPER=$(swww query | grep 'Path:' | awk '{print $2}')

        while true; do
            NEW_WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.webp" \) | shuf -n1)

            if [ "$NEW_WALLPAPER" != "$CURRENT_WALLPAPER" ] || [ -z "$CURRENT_WALLPAPER" ]; then
                break
            fi
        done

        if [ -n "$NEW_WALLPAPER" ]; then
            echo "Setting wallpaper: $NEW_WALLPAPER"
            ln -sf "$NEW_WALLPAPER" "$WALLPAPER_LINK"
            swww img "$NEW_WALLPAPER" --transition-type simple --transition-step 5 --transition-fps 60
        else
            echo "No images found in $WALLPAPER_DIR"
        fi
    else
        echo "swww is not installed or running."
    fi
  '';

  record_screen = pkgs.writeShellScriptBin "record_screen" ''
    if command -v wf-recorder >/dev/null 2>&1; then
        if pgrep -x "wf-recorder" >/dev/null; then
            pkill -INT -x wf-recorder
            dunstify "Finished Recording" "Recording has finished successfully."
            exit 0
        fi

        dateTime=$(date +%m-%d-%Y-%H:%M:%S)
        outputFile="$HOME/Videos/$dateTime.mp4"

        wf-recorder --audio --bframes max_b_frames -f $outputFile &
        dunstify "Recording Started" "Recording has started!"
    else
        echo "wf-recorder is not installed."
    fi
  '';
in {
  home.packages = with pkgs; [
    wallpaper_random
    record_screen
  ];
}
