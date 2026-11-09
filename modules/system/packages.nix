{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    docker-compose
    podman-tui
    libfido2
    pcsclite
    wl-clipboard
    dig
    github-copilot-cli
  ];
  fonts = {
    packages = with pkgs; [
      material-design-icons
      font-awesome_6
      nerd-fonts.symbols-only
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka
      nerd-fonts.roboto-mono
      noto-fonts
      noto-fonts-color-emoji
    ];
  };
}
