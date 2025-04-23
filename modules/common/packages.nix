# TODO try to put this in autoload
{
  inputs,
  pkgs,
  system,
  ...
}: {
  environment.systemPackages = with pkgs; [
    alejandra
    git
    curl
    wget
  ];
}
