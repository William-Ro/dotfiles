{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = lib.imports [
    ./hardware-configuration.nix
    ./networking.nix
    ./services/docker.nix
    ./services/ssh.nix
    "common/nix"
    "common/packages"
    "server/minecraft"
  ];

  nix.settings = {
    substituters = [
      "https://cache.nixos.org/"
      "https://playit-nixos-module.cachix.org"
    ];
    trusted-public-keys = [
      "playit-nixos-module.cachix.org-1:22hBXWXBbd/7o1cOnh+p0hpFUVk9lPdRLX3p5YSfRz4="
    ];
  };

  # Bootloader
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    initrd.kernelModules = ["virtio_gpu"];
    kernelParams = ["console=tty"];
  };

  # Username
  users.users.${config.username} = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
  };
  # Zsh
  programs.zsh.enable = true;

  # Extra Services
  services = {
    logind.lidSwitchExternalPower = "ignore";
    xserver = {
      xkb = {
        layout = "us";
        variant = "intl";
      };
    };
  };

  # NixOS System Version
  system.stateVersion = "24.11"; # Keep this at initial install version
}
