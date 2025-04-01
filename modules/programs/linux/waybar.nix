{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.waybar = {
    enable = true;
    systemd = {
      enable = false;
      target = "graphical-session.target";
    };
    style = ''
            * {
              font-family: "JetBrainsMono Nerd Font";
              font-size: 12pt;
              font-weight: bold;
              border-radius: 8px;
              transition-property: background-color;
              transition-duration: 0.5s;
            }
            window#waybar {
              background-color: transparent;
            }
            window > box {
              margin-left: 5px;
              margin-right: 5px;
              margin-top: 5px;
              background-color: #232323;
              padding: 3px;
              padding-left:8px;
              border: 2px none #d9e0ee;
            }
            tooltip {
              background: #232323;
            }
            tooltip label {
              color: #d9e0ee;
            }
      #custom-nix-icon {
              font-size: 20px;
              color: #d9e0ee;
            }
      #clock {
              color: rgb(217, 224, 238);
            }
      #audio {
              color: rgb(245, 224, 220);
            }
      #memory {
              color: rgb(181, 232, 224);
            }
      #cpu {
              color: rgb(245, 194, 231);
            }
      #network {
              color: #ABE9B3;
            }
      #network.disconnected {
              color: rgb(255, 255, 255);
            }

      #custom-nix-icon, #clock, #audio, #memory,#cpu, #network{
              padding-left: 10px;
              padding-right: 10px;
            }
    '';
    settings = [
      {
        "layer" = "top";
        "position" = "top";
        modules-left = [
          "custom/nix-icon"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "audio"
          "memory"
          "cpu"
          "network"
        ];
        "custom/nix-icon" = {
          "format" = " ";
          "on-click" = "pkill rofi || rofi2";
          "on-click-middle" = "exec wallpaper_default";
          "on-click-right" = "exec wallpaper_random";
          "tooltip" = false;
        };
        "clock" = {
          "interval" = 1;
          "format" = "{:%I:%M %p  %A %b %d}";
          "tooltip" = true;
          "tooltip-format" = "{:%A; %d %B %Y}\n<tt>{calendar}</tt>";
        };

        "audio" = {
          "scroll-step" = 1;
          "format" = "{icon} {volume}%";
          "format-muted" = "󰖁 Muted";
          "format-icons" = {
            "default" = ["" "" ""];
          };
          "on-click" = "pamixer -t";
          "tooltip" = false;
        };

        "memory" = {
          "interval" = 1;
          "format" = "󰻠 {percentage}%";
          "states" = {
            "warning" = 85;
          };
        };
        "cpu" = {
          "interval" = 1;
          "format" = "󰍛 {usage}%";
        };
        "network" = {
          "format-disconnected" = "󰯡 Disconnected";
          "format-ethernet" = "󰒢 Connected";
          "format-linked" = "󰖪 {essid} (No IP)";
          "format-wifi" = "󰖩 {essid}";
          "interval" = 1;
          "tooltip" = false;
        };
      }
    ];
  };
}
