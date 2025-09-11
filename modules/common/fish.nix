# [home-manager]
{
  config,
  lib,
  pkgs,
  ...
}: {
  config.programs.fish = {
    enable = true;

    plugins = [
      {
        name = "fish-async-prompt";
        src = pkgs.fishPlugins.async-prompt;
      }
      {
        # Using a fork of hydro that shows username@hostname on SSH connections
        name = "hydro";
        src = pkgs.fetchFromGitHub {
          owner = "thenktor";
          repo = "hydro";
          rev = "6714689d10b7173fe8d7afa9cba21d5839d31451";
          hash = "sha256-LknEQ1wMDRIJ8JcsPVK/LrJC0sgVWyR08pIEoNLnHPQ=";
        };
      }
      {
        name = "sponge";
        src = pkgs.fishPlugins.sponge;
      }
    ];

    functions = {
      fish_greeting = "";
    };

    shellAliases = {
      ll = "lsd -lh --group-dirs=first";
      la = "lsd -a --group-dirs=first";
      l = "lsd --group-dirs=first";
      lla = "lsd -lha --group-dirs=first";
      ls = "lsd --group-dirs=first";
      cat = "bat";

      vim = "nvim";
      vi = "nvim";
      v = "nvim";
      lg = "lazygit";
    };

    interactiveShellInit = ''
      set -U fish_prompt_pwd_dir_length 10
      set -g hydro_multiline false

      set -g hydro_symbol_start ""
      set -g hydro_symbol_prompt "→"
      set -g hydro_symbol_prompt ""
      set -g hydro_symbol_error ""
      set -g hydro_symbol_vim_cmd ""

      set -g hydro_symbol_git_dirty "*"
      set -g hydro_symbol_git_ahead "⇡"
      set -g hydro_symbol_git_behind "⇣"
      set -g hydro_symbol_git_stashed "≡"
      set -g hydro_color_git brblack

      set -g hydro_color_pwd blue
      set -g hydro_color_prompt magenta
      set -g hydro_color_duration yellow

      set -g hydro_cmd_duration_threshold 10000
    '';
  };
}
