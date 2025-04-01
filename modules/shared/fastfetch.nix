{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.fastfetch = {
    enable = true;

    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";

      logo = "nixos-linux";

      display = {
        color = {
          keys = "green";
          title = "blue";
        };
        percent.type = 9;
        separator = " 󰁔 ";
      };

      modules = [
        # Sección: Información del SO
        {
          type = "custom";
          outputColor = "blue";
          format = ''┌──────────── OS Information ────────────┐'';
        }
        {
          type = "title";
          key = " ╭─ ";
          keyColor = "green";
          color = {
            user = "green";
            host = "green";
          };
        }
        {
          type = "os";
          key = " ├─ "; # Icono para NixOS
          keyColor = "green";
        }
        {
          type = "kernel";
          key = " ├─ "; # Icono para kernel Linux
          keyColor = "green";
        }
        {
          type = "packages";
          key = " ├─ "; # Icono para paquetes Nix
          keyColor = "green";
        }
        {
          type = "shell";
          key = " ╰─  "; # Icono para shell
          keyColor = "green";
        }

        # Sección: Hardware
        {
          type = "custom";
          outputColor = "blue";
          format = ''├───────── Hardware Information ─────────┤'';
        }
        {
          type = "display";
          key = " ╭─ 󰍹 "; # Monitor
          keyColor = "blue";
          compactType = "original-with-refresh-rate";
        }
        {
          type = "cpu";
          key = " ├─ 󰍛 "; # CPU
          keyColor = "blue";
        }
        {
          type = "gpu";
          key = " ├─  "; # GPU
          keyColor = "blue";
        }
        {
          type = "disk";
          key = " ├─ 󱛟 "; # Disco
          keyColor = "blue";
        }
        {
          type = "memory";
          key = " ╰─  "; # Memoria
          keyColor = "blue";
        }

        # Sección: Software
        {
          type = "custom";
          outputColor = "blue";
          format = ''├───────── Software Information ─────────┤'';
        }
        {
          type = "wm";
          key = " ╭─  "; # Window Manager
          keyColor = "yellow";
        }
        {
          type = "terminal";
          key = " ╰──  "; # Terminal
          keyColor = "yellow";
        }

        # Cierre del marco
        {
          type = "custom";
          outputColor = "blue";
          format = ''└────────────────────────────────────────┘'';
        }
        {
          type = "custom";
          format = "   {#39}   {#34}    {#36}    {#35}    {#34}    {#33}    {#32}    {#31} ";
        }
        "break" # Salto de línea final
      ];
    };
  };
}
