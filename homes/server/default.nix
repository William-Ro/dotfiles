{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = lib.imports [
    # Common packages
    "common/fastfetch"
    "common/git"
    "common/home"
    "common/lazygit"
    "common/starship"
    "common/yazi"
    "common/zsh"
  ];

  home = {
    packages = with pkgs; [
    ];

    sessionVariables = {
    };

    file = {
    };
  };

  programs = {
  };

  home.stateVersion = "24.05";
}
