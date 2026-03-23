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
    ./nvidia.nix
    "system/nix"
    "system/packages"
    "system/locale"
    "system/audio"
    "gaming/steam"
    "linux/default"
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

  hardware.enableRedistributableFirmware = true;
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  hardware.ledger.enable = true;

  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;

  programs.zsh.enable = true;

  users.users.${config.username} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "plugdev"
    ];
    shell = pkgs.zsh;
  };

  services.gvfs.enable = true;
  services.flatpak.enable = true;

  virtualisation.containers.enable = true;
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };

  system.stateVersion = "24.05";
}
