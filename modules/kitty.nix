# modules/kitty/default.nix
{
  config,
  pkgs,
  ...
}: {
  # Configuración mínima para Kitty
  programs.kitty = {
    enable = true;
    extraConfig = ''
      # Colors
      foreground #c9c7cd
      background #161617

      color0  #27272a
      color1  #f5a191
      color2  #90b99f
      color3  #e6b99d
      color4  #aca1cf
      color5  #e29eca
      color6  #ea83a5
      color7  #c1c0d4

      color8  #353539
      color9  #ffae9f
      color10 #9dc6ac
      color11 #f0c5a9
      color12 #b9aeda
      color13 #ecaad6
      color14 #f591b2
      color15 #cac9dd

      cursor #757581
      cursor_text_color #c9c7cd

      # Font
      font_family JetBrainsMono Nerd Font
      font_size 22.0

      # Window
      window_padding_width 12
      dynamic_background_opacity 1.0

    '';
  };
}
