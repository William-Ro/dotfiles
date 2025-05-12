{
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.matugen.nixosModules.default
  ];

  programs.matugen = {
    enable = true;
    wallpaper = {
      # Path to the wallpaper image
      path = config.wallpaper;
    };

    templates = {
      kittty = {
        input_path = "${./templates/kitty-colors.conf}";
        output_path = "~/.config/kitty/colors.conf";
      };
    };
  };
}
