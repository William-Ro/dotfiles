{
  programs.rofi-wayland = {
    enable = true;
    font = "Roboto Mono 12";
    theme = ./rofi-theme.rasi;

    extraConfig = {
      "fixed-num-lines" = "true";
      "show-icons" = "false";
      "sidebar-mode" = "false";
      "scroll-method" = "1";
      "click-to-exit" = "true";
      "combi-hide-mode-prefix" = "false";
      "display-drun" = "\"\"";
      "disable-history" = "true";
    };
  };
}
