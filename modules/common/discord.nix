{
  pkgs,
  lib,
  config,
  ...
}: {
  home.packages = [
    (pkgs.discord.override {
      withTTS = true;
    })
  ];
}
