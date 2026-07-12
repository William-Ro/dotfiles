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
    "gaming/steam"
    "linux"
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
    xserver.enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    xserver.xkb = {
      layout = "us";
      variant = "";
    };

    printing.enable = true;
    gvfs.enable = true;
    flatpak.enable = true;

    pcscd.enable = true;
    # Disabled until a working Twingate configuration is provided for this host.
    twingate.enable = false;
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
      "plugdev"
    ];
    shell = pkgs.zsh;
  };

  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  system.stateVersion = "24.05";
}
