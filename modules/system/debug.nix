{ pkgs, ... }:
{
  # Fatal MCEs on CPU 6 (Bank 3); no_turbo tests whether boost-time power delivery is the cause.
  boot.kernelParams = [ "intel_pstate=no_turbo" ];

  hardware.rasdaemon.enable = true;

  environment.systemPackages = with pkgs; [
    lm_sensors
    stress-ng
    memtester
  ];
}
