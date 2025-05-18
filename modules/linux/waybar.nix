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
      }
      window#waybar {
        background-color: transparent;
      }
      window > box {
        margin-left: 10px;
        margin-right: 10px;
        margin-top: 6px;
        background-color: #1F1F1F;
        padding: 3px;
        padding-left:8px;
        border: 2px none #d9e0ee;
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
      #clock {
        color: #d9e0ee;
      }
      #pulseaudio {
        color: #d9e0ee;
      }
      #network {
        color: #d9e0ee;
      }
      #network.disconnected {
        color: #d9e0ee;
      }
      #custom-icon {
        color: #d9e0ee;
      }
      #clock, #pulseaudio, #bluetooth, #network, #custom-icon{
        padding-left: 10px;
        padding-right: 10px;
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
          "pulseaudio"
          "network"
          "custom/icon"
        ];
        "hyprland/workspaces" = {
          persistent-workspaces = {
            "*" = [1 2];
          };
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
          "format" = "{:%I:%M  %A %d %b}";
          "tooltip" = true;
        };

        "pulseaudio" = {
          "format" = "{icon} {volume}%";
          "format-muted" = "󰝟 0%";
          "on-click" = "wpctl set-mute @DEFAULT_SINK@ toggle";
          "on-click-right" = "pavucontrol";
          "on-scroll-up" = "wpctl set-volume -l 1.3 @DEFAULT_SINK@ 5%+";
          "on-scroll-down" = "wpctl set-volume @DEFAULT_SINK@ 5%-";
          "scroll-step" = 5;
          "format-icons" = {
            "headphone" = "󱡏";
            "hands-free" = "󱡏";
            "headset" = "󱡏";
            "default" = ["" ""];
          };
        };

        "network" = {
          "format-disconnected" = "󰯡 ";
          "format-ethernet" = "󰈀 ";
          "format-linked" = "󰖪 ";
          "format-wifi" = "󰖩 ";
          "interval" = 1;
          "on-click" = "nm-connection-editor";
          "tooltip" = false;
        };
        "custom/icon" = {
          "format" = " ";
          "on-click" = "exec wallpaper_random";
          "tooltip" = false;
        };
      }
    ];
  };
}
