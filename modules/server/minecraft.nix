{
  inputs,
  pkgs,
  ...
}:
# Make sure the flake inputs are in your system's config
{
  imports = [inputs.nix-minecraft.nixosModules.minecraft-servers];
  nixpkgs.overlays = [inputs.nix-minecraft.overlay];

  # Minecraft server settings
  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
    servers = {
      sergioland = {
        enable = true;
        jvmOpts = "-Xmx4G -Xms2G";

        # Specify the custom minecraft server package
        package = pkgs.minecraftServers.vanilla-1_21;
      };
    };
  };
}
