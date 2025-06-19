{
  pkgs,
  config,
  libs,
  ...
}: {
  # Load driver for Xorg and Wayland
  services.xserver.videoDrivers = ["amdgpu"];

  hardware = {
    graphics = {
      # Enable OpenGL
      enable = true;
      enable32Bit = true;
    };
  };
}
