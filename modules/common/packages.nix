# TODO try to put this in autoload
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
  # Fonts
  fonts = {
    packages = with pkgs; [
      # icon fonts
      material-design-icons
      font-awesome

      # nerdfonts
      nerd-fonts.symbols-only
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka

      noto-fonts
      noto-fonts-emoji
      font-awesome_5
      font-awesome_6
    ];
  };
}
