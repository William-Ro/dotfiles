{
  pkgs,
  config,
  lib,
  ...
}:
{
  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware = {
    graphics = {
      # Enable OpenGL
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        nvidia-vaapi-driver
      ];
    };
    nvidia = {
      # Modesetting is required.
      modesetting.enable = true;

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
      open = true;

      # Enable the Nvidia settings menu,
      # accessible via `nvidia-settings`.
      nvidiaSettings = true;

      # NOTE: was previously `nvidiaPackages.latest` (610.43.03). That driver
      # branch tracks NVIDIA's newest/least-tested releases and coincided with
      # gnome-shell segfaulting on almost every login since 2026-07-15 (crash
      # happens during KMS/EGL init on this nvidia-drm + amdgpu hybrid setup,
      # ~1s into shell startup, before any extensions even load — see
      # coredumpctl/journalctl history). Trying `.stable` instead since
      # Blackwell (RTX 50-series) support should have landed there by now;
      # revert to `.latest` if this causes other regressions (e.g. missing
      # feature support) rather than fixing the crash.
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
}
