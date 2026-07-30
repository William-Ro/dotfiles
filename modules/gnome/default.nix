{
  config,
  lib,
  pkgs,
  ...
}:
{
  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # Exclude default GNOME apps we don't need
  environment.gnome.excludePackages = with pkgs; [
    epiphany
    gnome-tour
    gnome-music
    totem
    geary
    gnome-calendar
    gnome-contacts
    gnome-maps
    gnome-weather
    simple-scan
    yelp
  ];

  # Disabled because programs.ssh.startAgent is enabled (hosts set their own SSH agent);
  # both cannot be enabled at the same time.
  services.gnome.gcr-ssh-agent.enable = false;

}
