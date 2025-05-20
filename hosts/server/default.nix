{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = lib.imports [
    ./hardware-configuration.nix
    "common/nix"
    "common/packages"
    "server/minecraft"
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

  # Username

  users.users.${config.username} = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
  };
  # Zsh
  programs.zsh.enable = true;

  # Docker & Podman
  virtualisation.docker.enable = true;

  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };
  # Services
  services = {
    logind.lidSwitchExternalPower = "ignore";
    openssh = {
      enable = true;
    };
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
