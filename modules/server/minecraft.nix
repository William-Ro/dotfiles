{
  inputs,
  pkgs,
  config,
  ...
}: {
  imports = [
    inputs.nix-minecraft.nixosModules.minecraft-servers
    inputs.playit-nixos-module.nixosModules.default
  ];
  nixpkgs.overlays = [inputs.nix-minecraft.overlay];

  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
    dataDir = "/var/lib/minecraft";

    servers = {
      sergioland2 = {
        enable = true;
        jvmOpts = "-Xmx10G -Xms6G";
        # Specify the custom minecraft server package
        package = pkgs.fabricServers.fabric-1_21.override {
          loaderVersion = "0.16.14";
        };
        serverProperties = {
          gamemode = "survival";
          difficulty = "normal";
          simulation-distance = 10;
          motd = "§k####§5 Sergioland §7§k####§r";
          max-players = 20;
        };
        whitelist = {
          /**/
        };
      };
    };
  };

  # Playit Agent
  services.playit = {
    enable = true;
    user = "playit";
    group = "playit";
    secretPath = "/etc/playit/secret.toml";
  };
}
