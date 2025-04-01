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
      #custom-icon {
        font-size: 20px;
        color: #d9e0ee;
      }
      #workspaces {
        background-color: #232323;
      }
      #workspaces button {
        color: #d9e0ee;
      }
      #workspaces button.active {
        color:rgb(74, 74, 74);
      }
      #clock {
        color: #d9e0ee;
      }
      #pulseaudio {
        color: #d9e0ee;
      }
      #memory {
        color: #d9e0ee;
      }
      #cpu {
        color: #d9e0ee;
      }
      #network {
        color: #d9e0ee;
      }
      #network.disconnected {
        color: #d9e0ee;
      }
      #custom-icon, #clock, #pulseaudio, #memory,#cpu, #network{
        padding-left: 10px;
        padding-right: 10px;
      }
    '';
    settings = [
      {
        "layer" = "top";
        "position" = "top";
        modules-left = [
          "custom/icon"
          "hyprland/workspaces"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "pulseaudio"
          "memory"
          "cpu"
          "network"
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

        "custom/icon" = {
          "format" = " ";
          "on-click" = "exec wallpaper_default";
          "on-click-right" = "exec wallpaper_random";
          "tooltip" = false;
        };
        "clock" = {
          "interval" = 1;
          "format" = "{:%I:%M %p  %A %b %d}";
          "tooltip" = true;
          "tooltip-format" = "{:%A; %d %B %Y}\n<tt>{calendar}</tt>";
        };

        "pulseaudio" = {
          "scroll-step" = 1;
          "format" = "{icon} {volume}%";
          "format-muted" = "󰝟 Muted";
          "format-icons" = {
            "default" = ["󰕾"];
          };
          "on-click" = "pamixer -t";
          "tooltip" = false;
        };

        "memory" = {
          "interval" = 1;
          "format" = "󰍛 {percentage}%";
          "states" = {
            "warning" = 85;
          };
        };
        "cpu" = {
          "interval" = 1;
          "format" = "󱃃 {usage}%";
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
