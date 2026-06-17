{ ... }:
{
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  security.polkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # Force analog stereo profile on the onboard Realtek ALC1220
    wireplumber.extraConfig = {
      "51-onboard-analog-profile" = {
        "monitor.alsa.rules" = [
          {
            matches = [ { "device.name" = "alsa_card.pci-0000_0d_00.6"; } ];
            actions = {
              update-props = {
                "device.profile" = "output:analog-stereo+input:analog-stereo";
              };
            };
          }
        ];
      };
    };
  };
}
