{...}: {
  programs.starship = {
    enable = true;

    enableZshIntegration = true;

    settings = {
      add_newline = true;

      format = ''
        [╭─user─── ](bold blue) $username
        [┣─system─ ](bold yellow) $hostname
        [┣─project ](bold red) $directory$rust$git_branch$git_status$package$golang$terraform$docker_context$python$docker_context$nodejs
        [╰─cmd──── ](bold green) '';

      username = {
        style_user = "green bold";
        style_root = "red bold";
        format = "[$user]($style) ";
        disabled = false;
        show_always = true;
      };

      hostname = {
        ssh_only = false;
        format = "on [$hostname](bold yellow) ";
        trim_at = ".";
        disabled = false;
      };

      character = {
        success_symbol = "[](bold green)";
        error_symbol = "[✗](bold red)";
      };

      directory = {
        read_only = " ";
        truncation_length = 10;
        truncate_to_repo = true;
        style = "bold italic blue";
      };

      cmd_duration = {
        min_time = 4;
        show_milliseconds = false;
        disabled = false;
        style = "bold italic red";
      };

      aws = {
        symbol = "  ";
      };

      conda = {
        symbol = " ";
      };

      dart = {
        symbol = " ";
      };

      elixir = {
        symbol = " ";
      };

      elm = {
        symbol = " ";
      };

      git_branch = {
        symbol = " ";
      };

      golang = {
        symbol = " ";
      };

      hg_branch = {
        symbol = " ";
      };

      java = {
        symbol = " ";
      };

      julia = {
        symbol = " ";
      };

      memory_usage = {
        symbol = "󰍛 ";
      };

      nim = {
        symbol = " ";
      };

      nix_shell = {
        symbol = " ";
      };

      package = {
        symbol = "󰏗 ";
      };

      perl = {
        symbol = " ";
      };

      php = {
        symbol = " ";
      };

      ruby = {
        symbol = " ";
      };

      rust = {
        symbol = " ";
      };

      scala = {
        symbol = " ";
      };

      shlvl = {
        symbol = " ";
      };
    };
  };
}
