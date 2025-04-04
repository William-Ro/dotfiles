{pkgs, ...}: {
  home.packages = [
    pkgs.tofi
  ];

  home.file.".config/tofi/config".text = ''
    output = "DP-1"
    font = "JetBrainsMono Nerd Font"
    font-size = 18
    font-features = ""
    font-variations = ""
    hint-font = true
    text-color = #ebdbb2
    background-color = #191919ee
    selection-background = #ebdbb2
    selection-background-padding = 8
    selection-background-corner-radius = 12
    prompt-color = #ebdbb2
    placeholder-color = #d5c4a1
    input-color = #cec5a3
    default-result-color = #ebdbb2
    selection-color = #1a1a1a
    selection-match-color = #20798d
    text-cursor-style = underscore
    text-cursor-corner-radius = 0
    text-cursor = false
    prompt-text = ""
    prompt-padding = 16
    placeholder-text = "wyw?"
    num-results = 6
    result-spacing = 20
    horizontal = false
    min-input-width = 130
    width = 100%
    height = 100%
    outline-width = 0
    outline-color = #ebdbb2
    border-width = 0
    border-color = #ebdbb2
    corner-radius = 4
    padding-top = 35%
    padding-bottom = 0
    padding-left = 43%
    padding-right = 0
    clip-to-padding = true
    scale = true
    output = "DP-1"
    anchor = center
    exclusive-zone = -1
    margin-top = 0%
    margin-bottom = 0
    margin-left = 0
    margin-right = 0
    hide-cursor = false
    history = true
    matching-algorithm = normal
    require-match = true
    auto-accept-single = false
    hide-input = false
    hidden-character = "*"
    physical-keybindings = false
    print-index = false
    drun-launch = false
    late-keyboard-init = false
    multi-instance = false
    ascii-input = false
  '';
}
