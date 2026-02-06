{
  pkgs,
  lib,
  config,
  system,
  ...
}: {
  home.packages = lib.optionals (system == "aarch64-darwin") [
    pkgs.discord
  ];
}
