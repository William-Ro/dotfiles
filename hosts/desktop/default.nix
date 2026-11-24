{
  config,
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
    udev.packages = [
      (pkgs.writeTextDir "lib/udev/rules.d/70-hidraw-uaccess.rules" ''
        KERNEL=="hidraw*", SUBSYSTEM=="hidraw", TAG+="uaccess"
      '')
    ];
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
      "dialout"
    ];
    shell = pkgs.zsh;
  };

  system.stateVersion = "24.05";
}
