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
    channel.enable = lib.mkDefault false;

    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      trusted-users = [
        "root"
        "@wheel"
        config.username
      ];

      log-lines = lib.mkDefault 25;

      # Avoid disk full issues
      max-free = lib.mkDefault (3000 * 1024 * 1024);
      min-free = lib.mkDefault (512 * 1024 * 1024);

      # Avoid copying unnecessary stuff over SSH
      builders-use-substitutes = true;

      # Fallback quickly if substituters are not available.
      connect-timeout = lib.mkDefault 5;

      warn-dirty = false;
    };

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
