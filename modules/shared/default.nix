{
  config,
  pkgs,
  lib,
  username,
  ...
}: {
  imports = [
    # Shared modules
    ./core.nix
    ./zsh.nix
    ./git.nix
    ./neovim.nix
    ./starship.nix
    ./discord.nix
    ./kitty.nix
    ./alacritty.nix
    ./lazygit.nix
    ./fastfetch.nix
    ./vscode.nix
    ./obsidian.nix
    ./nerdfetch.nix
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
