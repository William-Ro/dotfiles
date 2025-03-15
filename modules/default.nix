{
  config,
  pkgs,
  lib,
  username,
  ...
}: {
  # Determine if we are on macOS or NixOS
  imports = [
    # Common modules
    ./common/core.nix
    ./common/zsh.nix
    ./common/git.nix
    ./common/neovim.nix
    ./common/starship.nix
    ./common/discord.nix
    ./common/kitty.nix
    ./common/alacritty.nix
    ./common/lazygit.nix
    ./common/fastfetch.nix
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

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
