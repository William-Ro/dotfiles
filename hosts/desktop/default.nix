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

  # Bootloader
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      # Disables showing the generations menu, it can be still accessed when holding ‹spacebar› while booting
      # This makes the boot more "flicker free".
      timeout = 0;
    };
    initrd.systemd = {
      enable = true;
      # Required to support TPM-based unlocking of LUKS encrypted drives.
      # > sudo systemd-cryptenroll /dev/nvme0n1p6 --tpm2-device=auto --tpm2-pcrs=0+2+7
      # PCRs are important to guarantee tamper-proofing
      # Refer also to ./enable-tpm.sh
      tpm2.enable = true;
    };
  };

  # Firmware (required for CPU microcode updates)
  hardware.enableRedistributableFirmware = true;

  # Networking
  networking = {
    networkmanager.enable = true;
    # wireless.enable = true; # Uncomment if using Wi-Fi
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };

  # Bluetooth
  hardware.bluetooth.enable = true;

  # Display Manager
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
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

  # NixOS System Version
  system.stateVersion = "24.11"; # Keep this at initial install version
}
