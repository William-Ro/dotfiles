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
          "server-icon.png" = "${config}/server-icon.png";

          mods = pkgs.linkFarmFromDrvs "mods" (
            builtins.attrValues {
              Fabric-API = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/oGwyXeEI/fabric-api-0.102.0%2B1.21.jar";
                sha512 = "11732c4e36c3909360a24aa42a44da89048706cf10aaafa0404d7153cbc7395ff68a130f7b497828d6932740e004416b692650c3fbcc1f32babd7cb6eb9791d8";
              };
              ServerSleep = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/Cw8IlnGM/versions/Yy52wehM/serversleep-datapack2.jar";
                sha512 = "2c0e6fbf24177233451295957b02f2105d9af14c8c5d681c7a871f51d07798b734165a8a60fe899c4e6871ef0de86f0f3bd8df2d7500bdcb1149c871aaeba9c7";
              };
              UniversalGraves = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/yn9u3ypm/versions/Fg64B87Y/graves-3.4.4%2B1.21.jar";
                sha512 = "a247df6557c4020ea5499a1be54d1b2a90b33fffcb94866bf682b40a6524708360ec4e1e912aa10754722761ccabcf3674bea1f82f5438f225eada983e59989a";
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
