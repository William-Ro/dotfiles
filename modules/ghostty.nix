{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.ghostty.homeManagerModule
  ];
  programs.ghostty = {
    enable = true;
  };
}
