{
  pkgs,
  lib,
  config,
  ...
}: {
  home.packages = [
    pkgs.discord
  ];
}
