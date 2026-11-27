{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    libfido2
    pcsclite
    parted
    exfatprogs
    nvme-cli
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
