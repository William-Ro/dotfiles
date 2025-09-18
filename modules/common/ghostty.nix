{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.ghostty = {
    enable = true;

    settings = {
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
  };
}
