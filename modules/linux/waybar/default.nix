{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.waybar = {
    enable = true;

    style = ''
      * {
        font-family: "${config.font}";
        font-size: 12pt;
        font-weight: bold;
        border-radius: 8px;
        transition-property: background-color;
        transition-duration: 0.5s;
        min-height: 0;
        min-width: 0;

      }
      window#waybar {
        background-color: transparent;
      }
      window > box {
        margin-left: 10px;
        margin-right: 10px;
        margin-top: 10px;
        background-color: #1F1F1F;
        padding: 3px;
      }

      @keyframes blink_red {
        to {
          background-color: rgb(242, 143, 173);
          color: rgb(26, 24, 38);
        }
      }
      .warning, .critical, .urgent {
        animation-name: blink_red;
        animation-duration: 1s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      tooltip {
        background: #1F1F1F;
      }
      tooltip label {
        color: #d9e0ee;
      }

      #workspaces {
        background-color: #1F1F1F;
      }
      #workspaces button {
        color:rgb(74, 74, 74);
      }
      #workspaces button.active {
        color: #d9e0ee;
      }

      #workspaces,#custom-text,#tray,#pulseaudio,#network,#battery,#custom-icon,#clock {
        padding-left: 10px;
        padding-right: 10px;
        color: #d9e0ee;
      }
    '';
    settings = [
      {
        "layer" = "top";
        "position" = "top";

        modules-left = [
          "hyprland/workspaces"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "tray"
          "pulseaudio"
          "network"
          "battery"
          "custom/icon"
        ];
        "hyprland/workspaces" = {
          "format" = "{icon}";
          "on-click" = "activate";
          "sort-by-number" = true;
          "disable-scroll" = true;
          "format-icons" = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            "6" = "";
            "7" = "";
            "8" = "";
            "9" = "";
            "urgent" = "";
            "active" = "";
            "default" = "";
          };
          "tooltip" = false;
        };

        "clock" = {
          "interval" = 1;
          "format" = "{:%I:%M %a %d %b}";
          "tooltip" = false;
        };

        "tray" = {
          "icon-size" = 18;
          "spacing" = 15;
        };

        "pulseaudio" = {
          "format" = "{icon}";
          "format-muted" = "󰝟";
          "on-click" = "pavucontrol";
          "on-click-right" = "wpctl set-mute @DEFAULT_SINK@ toggle";
          "on-scroll-up" = "wpctl set-volume -l 1.3 @DEFAULT_SINK@ 5%+";
          "on-scroll-down" = "wpctl set-volume @DEFAULT_SINK@ 5%-";
          "scroll-step" = 5;
          "format-icons" = {
            "headphone" = "";
            "headset" = "";
            "default" = ["" ""];
          };
        };

        "network" = {
          "format-icons" = ["󰤟" "󰤢" "󰤥" "󰤨"];
          "format-wifi" = "{icon}";
          "format-ethernet" = "󰤨";
          "format-linked" = "󰄡";
          "format-disconnected" = "󰯡";
          "tooltip-format" = "{essid} ({signalStrength}%) - {gwaddr}";
          "tooltip-format-ethernet" = "{ifname} - {gwaddr}";
          "tooltip-format-disconnected" = "Disconnected";
          "on-click" = "nm-connection-editor";
        };
        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon}";
          format-full = "{icon}";
          format-charging = "";
          format-plugged = "";
          format-alt = "{icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };

        "battery#bat2" = {
          bat = "BAT2";
        };

        "custom/icon" = {
          "format" = " ";
          "on-click" = "exec wallpaper_random";
          "tooltip" = false;
        };
      }
    ];
  };
}
