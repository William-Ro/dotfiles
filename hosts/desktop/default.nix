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
  };

  # Internationalization
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_TIME = "en_US.UTF-8";
    LC_ADDRESS = "es_CR.UTF-8";
    LC_IDENTIFICATION = "es_CR.UTF-8";
    LC_MEASUREMENT = "es_CR.UTF-8";
    LC_MONETARY = "es_CR.UTF-8";
    LC_NAME = "es_CR.UTF-8";
    LC_NUMERIC = "es_CR.UTF-8";
    LC_PAPER = "es_CR.UTF-8";
    LC_TELEPHONE = "es_CR.UTF-8";
  };

  # Networking
  networking = {
    networkmanager.enable = true;
    # wireless.enable = true; # Uncomment if using Wi-Fi
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };

  # Bluetooth
  hardware.bluetooth.enable = true;

  # Sound (PipeWire)
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  security.polkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # jack.enable = true; # Uncomment if using JACK applications
    extraConfig.pipewire."adjust-sample-rate" = {
      "context.properties" = {
        "default.clock.rate" = 192000;
        "default.clock.allowed-rates" = [192000];
      };
    };
  };
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
