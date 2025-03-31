{...}: {
  programs.starship = {
    enable = true;

    enableZshIntegration = true;

    settings = {
      format = ''
        [](#bd93f9)$os$username[](bg:#ff79c6 fg:#bd93f9)$directory[](fg:#ff79c6 bg:#ffb86c)$git_branch$git_status[](fg:#ffb86c bg:#8be9fd)$c$elixir$elm$golang$gradle$haskell$java$julia$nodejs$nim$rust$scala[](fg:#8be9fd bg:#6272a4)[ ](fg:#6272a4)
      '';

      add_newline = true;

      username = {
        show_always = true;
        style_user = "bg:#bd93f9";
        style_root = "bg:#bd93f9";
        format = "[$user]($style)";
        disabled = false;
      };

      os = {
        style = "bg:#bd93f9";
        disabled = true;
        symbol = " ";
      };

      directory = {
        style = "bg:#ff79c6";
        format = "[ $path ]($style)";
        truncation_length = 3;
      };
      directory.substitutions = {
        "Documents" = "󰈙 ";
        "Downloads" = " ";
        "Music" = " ";
        "Pictures" = " ";
      };

      c = {
        symbol = " ";
        style = "bg:#8be9fd";
        format = "[ $symbol ($version) ]($style)";
      };
      docker_context = {
        symbol = "";
        style = "bg:#50fa7b";
        format = "[ $symbol $context ]($style)";
      };
      elixir = {
        symbol = "";
        style = "bg:#8be9fd";
        format = "[ $symbol ($version) ]($style)";
      };

      elm = {
        symbol = "";
        style = "bg:#8be9fd";
        format = "[ $symbol ($version) ]($style)";
      };

      git_branch = {
        symbol = "";
        style = "bg:#ffb86c";
        format = "[ $symbol $branch ]($style)";
      };

      git_status = {
        style = "bg:#ffb86c";
        format = "[$all_status$ahead_behind ]($style)";
      };

      nodejs = {
        symbol = "";
        style = "bg:#8be9fd";
        format = "[ $symbol ($version) ]($style)";
      };

      rust = {
        symbol = "";
        style = "bg:#8be9fd";
        format = "[ $symbol ($version) ]($style)";
      };

      time = {
        disabled = false;
        time_format = "%I:%M %p";
        style = "bg:#6272a4";
        format = "[ ♥ $time ]($style)";
      };
    };
  };
}
