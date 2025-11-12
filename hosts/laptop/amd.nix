{
  pkgs,
  config,
  lib,
  ...
}: {
  services.xserver.videoDrivers = ["amdgpu"];

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;

      extraPackages = with pkgs; [
        libvdpau
        mesa.drivers
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    vulkan-tools
    vulkan-validation-layers
    mesa
  ];
}
