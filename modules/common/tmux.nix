{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.tmux = {
    enable = true;
    shortcut = "a";
    keyMode = "vi";
    customPaneNavigationAndResize = true;
    baseIndex = 1;
    escapeTime = 0;
    historyLimit = 100000;
    extraConfig = ''
      set -g mouse on
    '';
  };
}
