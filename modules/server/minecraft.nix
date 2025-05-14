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

  # Servidor de Minecraft
  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
    servers = {
      sergioland = {
        enable = true;
        jvmOpts = "-Xmx4G -Xms2G";
        package = pkgs.minecraftServers.vanilla-1_21;
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
