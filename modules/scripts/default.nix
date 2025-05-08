{
  config,
  lib,
  pkgs,
  ...
}: let
  wallpaper_random = pkgs.writeShellScriptBin "wallpaper_random" ''
    if command -v swww >/dev/null 2>&1; then
        pkill -f dynamic_wallpaper || true

        WALLPAPER_DIR=$(dirname "${config.wallpaper}")

        # Obtener el wallpaper actual
        CURRENT_WALLPAPER=$(swww query | grep 'Path:' | awk '{print $2}')

        # Buscar un nuevo wallpaper que sea diferente al actual
        while true; do
            NEW_WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.webp" \) | shuf -n1)

            if [ "$NEW_WALLPAPER" != "$CURRENT_WALLPAPER" ] || [ -z "$CURRENT_WALLPAPER" ]; then
                break
            fi
        done

        if [ -n "$NEW_WALLPAPER" ]; then
            echo "Setting wallpaper: $NEW_WALLPAPER"
            swww img "$NEW_WALLPAPER" --transition-type simple
        else
            echo "No images found in $WALLPAPER_DIR"
        fi
    else
        echo "swww is not installed or running."
    fi
  '';

  wallpaper_default = pkgs.writeShellScriptBin "wallpaper_default" ''
    if command -v swww >/dev/null 2>&1; then
        swww img "${config.wallpaper}" --transition-type simple
    else
        echo "swww is not installed or running."
    fi
  '';
  record_screen = pkgs.writeShellScriptBin "record_screen" ''
    if command -v wf-recorder >/dev/null 2>&1; then
        # Verify if wf-recorder is already running
        if pgrep -x "wf-recorder" >/dev/null; then
            # If it is running, kill the process
            pkill -INT -x wf-recorder
            dunstify "Finished Recording" "Recording has finished successfully."
            exit 0
        fi

        # Save the current date and time in the format MM-DD-YYYY-HH:MM:SS
        dateTime=$(date +%m-%d-%Y-%H:%M:%S)
        outputFile="$HOME/Videos/$dateTime.mp4"

        # Start recording with wf-recorder
        wf-recorder --audio --bframes max_b_frames -f $outputFile &

        # Notify the user
        dunstify "Recording Started" "Recording has started!"
    else
        echo "wf-recorder is not installed."
    fi
  '';
in {
  home.packages = with pkgs; [
    wallpaper_random
    wallpaper_default
    record_screen
  ];
}
