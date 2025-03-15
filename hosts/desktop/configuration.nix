{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix # Include hardware scan results
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking = {
    networkmanager.enable = true;
    # wireless.enable = true; # Uncomment if using Wi-Fi
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };

  # Internationalization
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_CR.UTF-8";
    LC_IDENTIFICATION = "es_CR.UTF-8";
    LC_MEASUREMENT = "es_CR.UTF-8";
    LC_MONETARY = "es_CR.UTF-8";
    LC_NAME = "es_CR.UTF-8";
    LC_NUMERIC = "es_CR.UTF-8";
    LC_PAPER = "es_CR.UTF-8";
    LC_TELEPHONE = "es_CR.UTF-8";
    LC_TIME = "es_CR.UTF-8";
  };

  # X11 & Desktop Environment
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  # Sound (PipeWire)
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # jack.enable = true; # Uncomment if using JACK applications
  };

  # Printing
  services.printing.enable = true;

  # Programs
  programs.firefox.enable = true;
  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  # System Packages
  #environment.systemPackages = with pkgs; [
  #  vim
  #  wget
  #  git
  #];

  # System User Icon Setup
  system.activationScripts.userIcon.text = ''
    mkdir -p /var/lib/AccountsService/{icons,users}
    cp /home/deishuu/Pictures/face.png /var/lib/AccountsService/icons/deishuu
    echo -e "[User]\nIcon=/var/lib/AccountsService/icons/deishuu\n" > /var/lib/AccountsService/users/deishuu
  '';

  # OpenSSH (Optional)
  # services.openssh.enable = true;

  # Firewall Configuration (Optional)
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # networking.firewall.enable = false; # Disable firewall (not recommended)

  # NixOS System Version
  system.stateVersion = "24.11"; # Keep this at initial install version
}
