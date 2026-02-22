{
  config,
  inputs,
  lib,
  system,
  ...
}:
{
  time.timeZone = "America/Costa_Rica";

  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    settings.trusted-users = [
      "root"
      config.username
    ];

    registry.nixpkgs.flake = inputs.nixpkgs;
    nixPath = lib.mapAttrsToList (name: value: "${name}=${value}") (
      lib.filterAttrs (_: value: value ? _type && value._type == "flake") inputs
    );

    gc = {
      automatic = true;
      dates = lib.mkIf (system != "aarch64-darwin") "weekly";
      options = "--delete-older-than 1w";
    };

    optimise.automatic = true;
  };
}
