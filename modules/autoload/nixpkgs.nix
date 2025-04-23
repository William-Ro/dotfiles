{pkgs, ...}: {
  #
  nix.package = pkgs.nix;
  nixpkgs.config.allowUnfree = true;
}
