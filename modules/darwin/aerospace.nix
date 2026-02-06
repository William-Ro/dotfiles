{pkgs, ...}: {
  home.packages = with pkgs; [
    aerospace
  ];
  home.file.".aerospace.toml".text = ''
    start-at-login = true

    enable-normalization-flatten-containers = true
    enable-normalization-opposite-orientation-for-nested-containers = true

    accordion-padding = 30

    default-root-container-layout = 'tiles'
    default-root-container-orientation = 'auto'

    on-focused-monitor-changed = ['move-mouse monitor-lazy-center']
    on-focus-changed = ['move-mouse window-lazy-center']

    automatically-unhide-macos-hidden-apps = true

    [key-mapping]
    preset = 'qwerty'

    [gaps]
    inner.horizontal = 10
    inner.vertical = 10
    outer.left = 10
    outer.bottom = 10
    outer.top = 10
    outer.right = 10

    [mode.main.binding]
    # Launch terminal
    alt-enter = 'exec-and-forget open -na alacritty'

    # Close focused window
    alt-q = 'close'

    # Toggle fullscreen
    alt-f = 'fullscreen'

    # Focus movement
    alt-left = 'focus left'
    alt-right = 'focus right'
    alt-up = 'focus up'
    alt-down = 'focus down'

    # Move window
    alt-shift-left = 'move left'
    alt-shift-right = 'move right'
    alt-shift-up = 'move up'
    alt-shift-down = 'move down'

    # Resize window
    alt-shift-minus = 'resize smart -50'
    alt-shift-equal = 'resize smart +50'

    # Change layout
    alt-t = 'layout floating tiling'
    alt-p = 'layout tiles horizontal vertical'
    alt-r = 'layout accordion horizontal vertical'

    # Switch workspace
    alt-1 = 'workspace 1'
    alt-2 = 'workspace 2'
    alt-3 = 'workspace 3'
    alt-4 = 'workspace 4'
    alt-5 = 'workspace 5'
    alt-6 = 'workspace 6'
    alt-7 = 'workspace 7'
    alt-8 = 'workspace 8'
    alt-9 = 'workspace 9'

    # Move window to workspace
    alt-shift-1 = 'move-node-to-workspace 1'
    alt-shift-2 = 'move-node-to-workspace 2'
    alt-shift-3 = 'move-node-to-workspace 3'
    alt-shift-4 = 'move-node-to-workspace 4'
    alt-shift-5 = 'move-node-to-workspace 5'
    alt-shift-6 = 'move-node-to-workspace 6'
    alt-shift-7 = 'move-node-to-workspace 7'
    alt-shift-8 = 'move-node-to-workspace 8'
    alt-shift-9 = 'move-node-to-workspace 9'

  '';
}
