{
  networking = {
    useDHCP = false;
    nameservers = ["8.8.8.8" "8.8.4.4"];
    firewall.enable = true;
  };

  services.resolved.enable = true;

  # static ip configuration
  systemd.network = {
    enable = true;
    networks."local-lan" = {
      matchConfig.Name = "enp0s20f0u1u4";
      networkConfig.DHCP = "no";
      address = [
        "192.168.1.49/24"
      ];
      routes = [
        {
          Gateway = "192.168.1.1";
          GatewayOnLink = true;
        }
      ];
    };
  };
}
