{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
  };
  home.file."./.config/ghostty/config".text = ''
    theme = deishuu
    adjust-cell-height = 10%
    window-theme = dark
    window-height = 20
    window-width = 110
    window-padding-x = 20
    window-padding-y = 20
    background-opacity = 1
    background-blur-radius = 60
    cursor-style = bar
    mouse-hide-while-typing = true



    # tabs
    keybind = alt+s>c=new_tab
    keybind = alt+s>shift+l=next_tab
    keybind = alt+s>shift+h=previous_tab
    keybind = alt+s>comma=move_tab:-1
    keybind = alt+s>period=move_tab:1

    # quick tab switch
    keybind = alt+s>1=goto_tab:1
    keybind = alt+s>2=goto_tab:2
    keybind = alt+s>3=goto_tab:3
    keybind = alt+s>4=goto_tab:4
    keybind = alt+s>5=goto_tab:5
    keybind = alt+s>6=goto_tab:6
    keybind = alt+s>7=goto_tab:7
    keybind = alt+s>8=goto_tab:8
    keybind = alt+s>9=goto_tab:9

    # split
    keybind = alt+s>\=new_split:right
    keybind = alt+s>-=new_split:down

    keybind = alt+s>j=goto_split:bottom
    keybind = alt+s>k=goto_split:top
    keybind = alt+s>h=goto_split:left
    keybind = alt+s>l=goto_split:right

    keybind = alt+s>z=toggle_split_zoom

    keybind = alt+s>e=equalize_splits

    # other
    #copy-on-select = clipboard

    font-size = 22
    font-family = JetBrainsMono Nerd Font

    title = "Deishuu's Ghostty"

    wait-after-command = false
    shell-integration = detect
    window-save-state = always
    gtk-single-instance = true
    unfocused-split-opacity = 0.5
    quick-terminal-position = center
    shell-integration-features = cursor,sudo
  '';

  # Custom theme
  home.file.".config/ghostty/themes/deishuu".text = ''
    palette = 0=#45475a
    palette = 1=#f38ba8
    palette = 2=#a6e3a1
    palette = 3=#f9e2af
    palette = 4=#89b4fa
    palette = 5=#f5c2e7
    palette = 6=#94e2d5
    palette = 7=#a6adc8
    palette = 8=#585b70
    palette = 9=#f37799
    palette = 10=#89d88b
    palette = 11=#ebd391
    palette = 12=#74a8fc
    palette = 13=#f2aede
    palette = 14=#6bd7ca
    palette = 15=#bac2de
    background = #1F1F1F
    foreground = #d9e0ee
    cursor-color = #f5e0dc
    cursor-text = #cdd6f4
    selection-background = #585b70
    selection-foreground = #cdd6f4
  '';
}
