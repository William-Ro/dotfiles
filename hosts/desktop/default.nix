{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = lib.imports [
    ./hardware-configuration.nix
    ./nvidia.nix
    "common/nix"
    "common/packages"
    "common/locale"
    "common/audio"
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
    extraGroups = ["wheel" "networkmanager" "docker"];
    shell = pkgs.zsh;
  };

  services.gvfs.enable = true;
  services.flatpak.enable = true;

  virtualisation.docker = {
    enable = true;
    logDriver = "none";
  };

  system.stateVersion = "24.11";
}
