{
  config,
  pkgs,
  lib,
  username,
  ...
}: {
  imports = [
    # Shared modules
    ./shared/default.nix
    ./scripts/default.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = username;
    homeDirectory =
      if pkgs.stdenv.isDarwin
      then "/Users/${username}"
      else "/home/${username}";

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "24.05";
  };

  home.sessionVariables = {
    # Force all applications to use Wayland
    # Source: https://wiki.hyprland.org/Getting-Started/Master-Tutorial/#force-apps-to-use-wayland
    NIXOS_OZONE_WL = "1";
  };

  # Enable the Wayland backend for Electron applications
  xdg.configFile."electron-flags.conf".text = ''
    --enable-features=UseOzonePlatform
    --ozone-platform=wayland
  '';

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
