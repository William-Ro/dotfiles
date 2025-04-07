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
          swww img ~/Pictures/wallpapers/wallpaper.png  --transition-type simple
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
        wf-recorder --bframes max_b_frames -f $outputFile &

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
