{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = lib.imports [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480s
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

  networking.networkmanager.enable = true;
  networking.enableIPv6 = false;
  hardware.bluetooth.enable = true;

  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.tailscale.enable = true;

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

  system.stateVersion = "24.05";
}
