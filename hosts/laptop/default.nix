{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
{
  imports = lib.imports [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480s
    "system/nix"
    "system/packages"
    "system/locale"
    "system/audio"
    "system/virtualisation"
    "gaming/steam"
    "gnome"
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };
    initrd.systemd = {
      enable = true;
      tpm2.enable = true;
    };
  };

  hardware = {
    enableRedistributableFirmware = true;
    bluetooth.enable = true;
  };

  networking.networkmanager.enable = true;

  services = {
    printing.enable = true;
    gvfs.enable = true;
    flatpak.enable = true;
    twingate.enable = true;
  };

  programs = {
    zsh.enable = true;
    ssh.startAgent = true;
  };

  users.users.${config.username} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "podman"
    ];
    shell = pkgs.zsh;
  };

  system.stateVersion = "24.05";
}
