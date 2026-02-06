{
  pkgs,
  lib,
  config,
  ...
}: {
  home.packages = [
    pkgs.vesktop
  ];
}
