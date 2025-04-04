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
          "all-outputs" = true;
          "active-only" = false;
          "disable-scroll" = true;
          "format" = "{icon}";
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
          "format" = "{:%I:%M  %A %b %d}";
          "tooltip" = true;
          "tooltip-format" = "{:%A; %d %B %Y}\n<tt>{calendar}</tt>";
        };

        "pulseaudio" = {
          "format" = "{icon}";
          "format-muted" = "{format_source}";
          "format-bluetooth" = "{icon}";
          "format-bluetooth-muted" = "{format_source}";
          "format-source" = " ";
          "format-icons" = {
            "default" = [" " " " " "];
          };
          "on-click" = "pavucontrol";
          "on-click-right" = "pamixer -t";
          "tooltip" = false;
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
          "on-click" = "exec wallpaper_default";
          "on-click-right" = "exec wallpaper_random";
          "tooltip" = false;
        };
      }
    ];
  };
}
