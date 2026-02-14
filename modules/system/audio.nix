{...}: {
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  security.polkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    # Set proper sample rate (48kHz is standard for most audio)
    extraConfig.pipewire."92-low-latency" = {
      "context.properties" = {
        "default.clock.rate" = 48000;
        "default.clock.allowed-rates" = [44100 48000];
      };
    };

    # Allow volume above 100% to compensate for quiet speakers
    wireplumber.extraConfig."51-increase-headroom" = {
      "monitor.alsa.rules" = [
        {
          matches = [{"node.name" = "~alsa_output.*";}];
          actions.update-props = {
            "session.suspend-timeout-seconds" = 0;
          };
        }
      ];
    };
  };
}
