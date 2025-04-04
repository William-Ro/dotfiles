{...}: {
  # This module configures the Starship prompt for the shell.
  # It sets up the prompt format, colors, and various components
  # such as the OS, directory, git branch, and more.
  # Source: https://github.com/starship/starship/discussions/1107
  # Credits: @wesleey
  programs.starship = {
    enable = true;
    settings = {
      format = ''
        [╭](fg:current_line)$os$directory$git_branch$fill$nodejs$dotnet$python$java$c$cmd_duration$shell$time$username$line_break$character
      '';

      palette = "deishuu";
      add_newline = true;

      palettes.deishuu = {
        foreground = "#cdd6f4";
        background = "#1e1e2e";
        current_line = "#313244";
        primary = "#1e1e2e";
        box = "#313244";
        blue = "#89b4fa";
        cyan = "#94e2d5";
        green = "#a6e3a1";
        orange = "#fab387";
        pink = "#f5c2e7";
        purple = "#cba6f7";
        red = "#f38ba8";
        yellow = "#f9e2af";
      };

      os = {
        format = "(fg:current_line)[](fg:red)[$symbol ](fg:primary bg:red)[](fg:red)";
        disabled = false;
        symbols = {
          Alpine = "";
          Amazon = "";
          Android = "";
          Arch = "";
          CentOS = "";
          Debian = "";
          EndeavourOS = "";
          Fedora = "";
          FreeBSD = "";
          Garuda = "";
          Gentoo = "";
          Linux = "";
          Macos = "";
          Manjaro = "";
          Mariner = "";
          Mint = "";
          NetBSD = "";
          NixOS = "";
          OpenBSD = "";
          OpenCloudOS = "";
          openEuler = "";
          openSUSE = "";
          OracleLinux = "⊂⊃";
          Pop = "";
          Raspbian = "";
          Redhat = "";
          RedHatEnterprise = "";
          Solus = "";
          SUSE = "";
          Ubuntu = "";
          Unknown = "";
          Windows = "";
        };
      };

      directory = {
        format = "[─](fg:current_line)[](fg:pink)[󰷏 ](fg:primary bg:pink)[](fg:pink bg:box)[ $path](fg:foreground bg:box)[](fg:box)";
        truncation_length = 2;
        read_only_style = "";
      };

      git_branch = {
        format = "[─](fg:current_line)[](fg:green)[$symbol](fg:primary bg:green)[](fg:green bg:box)[ $branch](fg:foreground bg:box)[](fg:box)";
        symbol = " ";
      };

      nodejs = {
        format = "[─](fg:current_line)[](fg:green)[$symbol](fg:primary bg:green)[](fg:green bg:box)[ $version](fg:foreground bg:box)[](fg:box)";
        symbol = "󰎙 Node.js";
      };

      dotnet = {
        format = "[─](fg:current_line)[](fg:purple)[$symbol](fg:primary bg:purple)[](fg:purple bg:box)[ $tfm](fg:foreground bg:box)[](fg:box)";
        symbol = " .NET";
      };

      python = {
        format = "[─](fg:current_line)[](fg:green)[$symbol](fg:primary bg:green)[](fg:green bg:box)[ $version](fg:foreground bg:box)[](fg:box)";
        symbol = " python";
      };

      java = {
        format = "[─](fg:current_line)[](fg:red)[$symbol](fg:primary bg:red)[](fg:red bg:box)[ $version](fg:foreground bg:box)[](fg:box)";
        symbol = " Java";
      };

      c = {
        format = "[─](fg:current_line)[](fg:blue)[$symbol](fg:primary bg:blue)[](fg:blue bg:box)[ $version](fg:foreground bg:box)[](fg:box)";
        symbol = " C";
      };

      fill = {
        symbol = "─";
        style = "fg:current_line";
      };

      cmd_duration = {
        min_time = 500;
        format = "[─](fg:current_line)[](fg:orange)[ ](fg:primary bg:orange)[](fg:orange bg:box)[ $duration ](fg:foreground bg:box)[](fg:box)";
      };

      shell = {
        format = "[─](fg:current_line)[](fg:blue)[ ](fg:primary bg:blue)[](fg:blue bg:box)[ $indicator](fg:foreground bg:box)[](fg:box)";
        unknown_indicator = "shell";
        powershell_indicator = "powershell";
        fish_indicator = "fish";
        disabled = false;
      };

      time = {
        format = "[─](fg:current_line)[](fg:purple)[󰦖 ](fg:primary bg:purple)[](fg:purple bg:box)[ $time](fg:foreground bg:box)[](fg:box)";
        time_format = "%H:%M";
        disabled = false;
      };

      username = {
        format = "[─](fg:current_line)[](fg:yellow)[ ](fg:primary bg:yellow)[](fg:yellow bg:box)[ $user](fg:foreground bg:box)[](fg:box) ";
        show_always = true;
      };

      character = {
        format = ''
          [╰─$symbol](fg:current_line) '';
        success_symbol = "[](fg:bold white)";
        error_symbol = "[×](fg:bold red)";
      };
    };
  };
}
