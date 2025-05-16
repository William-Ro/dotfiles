{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.python3 = {
    enable = true;
    package = pkgs.python3;
  };
}
