{
  inputs,
  pkgs,
  system,
  ...
}: {
  environment.systemPackages = with pkgs; [
    alejandra
    git
    curl
    wget
  ];
  fonts = {
    packages = with pkgs; [
      material-design-icons
      font-awesome
      nerd-fonts.symbols-only
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka
      nerd-fonts.roboto-mono
      noto-fonts
      noto-fonts-color-emoji
      font-awesome_5
      font-awesome_6
    ];
  };
}
