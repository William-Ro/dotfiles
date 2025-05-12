{inputs, ...}: {
  imports = [
    inputs.matugen.nixosModules.default
  ];

  programs.matugen = {
    enable = true;

    templates = {
      kittty = {
        input_path = "./templates/kitty.conf";
        output_path = "~/.config/kitty/colors.conf";
      };
    };
  };
}
