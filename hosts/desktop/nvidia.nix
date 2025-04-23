{
  pkgs,
  config,
  libs,
  ...
}: {
  nixpkgs.config.nvidia.acceptLicense = true;
  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];
  environment.variables = {
    # To force GBM as a backend
    # Source: https://wiki.hyprland.org/Configuring/Environment-variables/
    GBM_BACKEND = "nvidia-drm";
    # Nvidia drivers Hyprland wiki
    # Source: https://wiki.hyprland.org/Nvidia/
    LIBVA_DRIVER_NAME = "nvidia";
    #If you face problems with Discord windows not displaying or screen sharing not working in Zoom, first try running them in Native Wayland. Otherwise, remove or comment this line.
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };
  environment.systemPackages = with pkgs; [
    vulkan-loader
    vulkan-validation-layers
    vulkan-tools
  ];
  hardware = {
    graphics = {
      # Enable OpenGL
      enable = true;
      #driSupport = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        nvidia-vaapi-driver
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
    nvidia = {
      # Modesetting is required.
      modesetting.enable = true;

      # Enable full composition pipeline
      forceFullCompositionPipeline = true;

      # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
      powerManagement.enable = true;
      # Fine-grained power management. Turns off GPU when not in use.
      # Experimental and only works on modern Nvidia GPUs (Turing or newer).
      powerManagement.finegrained = false;

      # Use the NVidia open source kernel module (not to be confused with the
      # independent third-party "nouveau" open source driver).
      # Support is limited to the Turing and later architectures. Full list of
      # supported GPUs is at:
      # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
      # Only available from driver 515.43.04+
      # Currently alpha-quality/buggy, so false is currently the recommended setting.
      open = false;

      # Enable the Nvidia settings menu,
      # accessible via `nvidia-settings`.
      nvidiaSettings = true;

      # Optionally, you may need to select the appropriate driver version for your specific GPU.
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
}
