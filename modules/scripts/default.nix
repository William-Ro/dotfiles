{
  config,
  lib,
  pkgs,
  ...
}: let
  wallpaper_random = pkgs.writeShellScriptBin "wallpaper_random" ''
    if command -v swww >/dev/null 2>&1; then
        # Kill any existing dynamic wallpaper process if running
        pkill -f dynamic_wallpaper || true

        WALLPAPER_LINK="${config.wallpaper}"
        WALLPAPER_DIR=$(dirname "$WALLPAPER_LINK")

        # Get the current wallpaper path from swww
        CURRENT_WALLPAPER=$(swww query | grep 'Path:' | awk '{print $2}')

        # Find a new wallpaper that is different from the current one
        while true; do
            NEW_WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.webp" \) | shuf -n1)

            if [ "$NEW_WALLPAPER" != "$CURRENT_WALLPAPER" ] || [ -z "$CURRENT_WALLPAPER" ]; then
                break
            fi
        done

        if [ -n "$NEW_WALLPAPER" ]; then
            echo "Setting wallpaper: $NEW_WALLPAPER"

            # Update the symlink to point to the new wallpaper
            ln -sf "$NEW_WALLPAPER" "$WALLPAPER_LINK"

            # Apply the new wallpaper using swww with a simple transition
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
    record_screen
  ];
}
