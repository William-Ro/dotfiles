{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    attachExistingSession = true;
    settings = {
      default_layout = "compact";
      theme = "catppuccin-mocha";
      show_startup_tips = false;
    };
  };
}
