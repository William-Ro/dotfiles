{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.ghostty = {
    enable = true;

    settings = {
      theme = "deishuu";
      "adjust-cell-height" = "10%";
      "window-theme" = "dark";
      "window-height" = 20;
      "window-width" = 110;
      "window-padding-x" = 20;
      "window-padding-y" = 20;
      "background-opacity" = 1;
      "background-blur-radius" = 60;
      "cursor-style" = "bar";
      "mouse-hide-while-typing" = true;

      # Tabs
      keybind = [
        "alt+s>c=new_tab"
        "alt+s>shift+l=next_tab"
        "alt+s>shift+h=previous_tab"
        "alt+s>comma=move_tab:-1"
        "alt+s>period=move_tab:1"

        # Quick tab switch
        "alt+s>1=goto_tab:1"
        "alt+s>2=goto_tab:2"
        "alt+s>3=goto_tab:3"
        "alt+s>4=goto_tab:4"
        "alt+s>5=goto_tab:5"
        "alt+s>6=goto_tab:6"
        "alt+s>7=goto_tab:7"
        "alt+s>8=goto_tab:8"
        "alt+s>9=goto_tab:9"

        # Split
        "alt+s>\\=new_split:right"
        "alt+s>-=new_split:down"
        "alt+s>j=goto_split:bottom"
        "alt+s>k=goto_split:top"
        "alt+s>h=goto_split:left"
        "alt+s>l=goto_split:right"
        "alt+s>z=toggle_split_zoom"
        "alt+s>e=equalize_splits"
      ];

      # Other settings
      "font-size" = 22;
      "font-family" = "${config.font}";
      "wait-after-command" = false;
      "shell-integration" = "detect";
      "window-save-state" = "always";
      "gtk-single-instance" = true;
      "unfocused-split-opacity" = 0.5;
      "quick-terminal-position" = "center";
      "shell-integration-features" = "cursor,sudo";
    };

    themes = {
      deishuu = {
        palette = [
          "0=#45475a"
          "1=#f38ba8"
          "2=#a6e3a1"
          "3=#f9e2af"
          "4=#89b4fa"
          "5=#f5c2e7"
          "6=#94e2d5"
          "7=#a6adc8"
          "8=#585b70"
          "9=#f37799"
          "10=#89d88b"
          "11=#ebd391"
          "12=#74a8fc"
          "13=#f2aede"
          "14=#6bd7ca"
          "15=#bac2de"
        ];
        background = "#1F1F1F";
        foreground = "#d9e0ee";
        "cursor-color" = "#f5e0dc";
        "cursor-text" = "#cdd6f4";
        "selection-background" = "#585b70";
        "selection-foreground" = "#cdd6f4";
      };
    };
  };
}
