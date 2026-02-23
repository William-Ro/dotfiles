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
      # Enable support for nix commands and flakes
      experimental-features = ["nix-command" "flakes"];

      # If the user is in @wheel they are trusted by default.
      trusted-users = ["root" "@wheel" config.username];

      # The default at 10 is rarely enough.
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
      dates = if system != "aarch64-darwin" then "weekly" else lib.mkDefault "weekly";
      options = "--delete-older-than 1w";
    };

    optimise.automatic = true;
  };
}
