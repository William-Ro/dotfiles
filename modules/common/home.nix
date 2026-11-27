{
  config,
  pkgs,
  ...
}:
{

  home = {
    inherit (config) username;
    homeDirectory = config.home_path;
    packages = with pkgs; [
      # Core
      home-manager
      fontconfig
      which

      # Nix tools
      alejandra

      # Archive
      zip
      xz
      unzip
      p7zip

      # CLI utilities
      lsd
      bat
      jq
      tree
      htop
      tldr
      killall
      nerdfetch
      pipes

      # TUI tools
      glow
      btop

      # Media
      mpv
      imv
      ffmpegthumbnailer

      # Network & clipboard
      dig
      openssl
      wl-clipboard
    ];
  };

  news.display = "silent";
}
