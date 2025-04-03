{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
  };
  home.file."./.config/ghostty/config".text = ''
    theme = deishuu.conf
    adjust-cell-height = 10%
    window-theme = dark
    window-height = 20
    window-width = 110
    window-padding-x = 20
    window-padding-y = 20
    background-opacity = 1
    background-blur-radius = 60
    selection-background = #1F1F1F
    selection-foreground = #d9e0ee
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
  home.file.".config/ghostty/themes/deishuu.conf".text = ''
    palette = 0=#51576d
    palette = 1=#e78284
    palette = 2=#a6d189
    palette = 3=#e5c890
    palette = 4=#8caaee
    palette = 5=#f4b8e4
    palette = 6=#81c8be
    palette = 7=#a5adce
    palette = 8=#626880
    palette = 9=#e67172
    palette = 10=#8ec772
    palette = 11=#d9ba73
    palette = 12=#7b9ef0
    palette = 13=#f2a4db
    palette = 14=#5abfb5
    palette = 15=#b5bfe2
    background = #1F1F1F
    foreground = #d9e0ee
    cursor-color = #f2d5cf
    cursor-text = #c6d0f5
    selection-background = #626880
    selection-foreground = #c6d0f5
  '';
}
