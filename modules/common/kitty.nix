{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.kitty = {
    enable = true;

    extraConfig = ''
      # Font
      font_family JetBrainsMono Nerd Font
      font_size 22.0

      # Window
      window_padding_width 12
      dynamic_background_opacity 1.0

      include colors.conf

    '';
  };
}
