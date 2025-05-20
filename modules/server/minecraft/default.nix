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
        symlinks = {
          mods = pkgs.linkFarmFromDrvs "mods" (
            builtins.attrValues {
              Fabric-API = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/oGwyXeEI/fabric-api-0.102.0%2B1.21.jar";
                hash = "sha512-EXMsTjbDkJNgokqkKkTaiQSHBs8Qqq+gQE1xU8vHOV/2ihMPe0l4KNaTJ0DgBEFraSZQw/vMHzK6vXy265eR2A==";
              };
              ServerSleep = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/Cw8IlnGM/versions/Yy52wehM/serversleep-datapack2.jar";
                hash = "sha512-LA5vvyQXcjNFEpWVewLyEF2a8UyMXWgceocfUdB3mLc0FlqKYP6JnE5oce8N6G8PO9jfLXUAvcsRSchxquupxw==";
              };
              UniversalGraves = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/yn9u3ypm/versions/Fg64B87Y/graves-3.4.4%2B1.21.jar";
                hash = "sha512-okffZVfEAg6lSZob5U0bKpCzP//LlIZr9oK0CmUkcINg7E4ekSqhB1RyJ2HMq882dL6h+C9UOPIl6tqYPlmYmg==";
              };
              StyledPlayerList = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/DQIfKUHf/versions/Ui7MOgqG/styledplayerlist-3.5.1%2B1.21.jar";
                hash = "sha512-aXbbxdr/8ymuoYsqf8IENmQCcVEdn8FxS3diA4Lk5GdUyRQAlk0/xynGLXi9eyBFIevakE5Z6RkrKGbAJJGABA==";
              };
              Polymer = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/xGdtZczs/versions/p33F2gAj/polymer-bundled-0.9.9%2B1.21.jar";
                hash = "sha512-qhDNCiXABlttk8il3mu6AoPsDVsAIDWmDnZ+/fN8Rznn9IX5QpZ1jWx1Iyvp50GCw8wLlVFIj0flFnaWb8bIng==";
              };
              ServerBackpacks = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/E7IsBILg/versions/bR4UNS3n/serverbackpacks-1.1.2.jar";
                hash = "sha512-60Cy/3f6Qrnd0WmXT94LRvea6o5MVGnmlQxQxp2qRKS/0lsRipocQykJnoFlyJWb8geRyOEPQhZPrz2WCm2JCg==";
              };
              AntiCreeper = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/Uqqp9wzq/versions/tyJRFJbu/anti-creeper-1.1.0.jar";
                hash = "sha512-pQhvaztLAPsgLIM9zsr83n2Hiafj70+1n0ywwWyUVeDf5Aa22ScB3DiDZ/ymef5R2AoCiIgKVmURiCLxGJ5suQ==";
              };
            }
          );
        };
        serverProperties = {
          gamemode = "survival";
          difficulty = "normal";
          simulation-distance = 10;
          motd = "§k####§5 Sergioland §7§k####§r";
          max-players = 20;
        };
        operators = {
          Rataconthiner666 = "199fc74b-c22b-4a06-be90-0ab8ac3a3bc0";
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
