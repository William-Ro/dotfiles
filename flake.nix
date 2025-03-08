{
  description = "deishuu macOS/nixOS configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

    # Darwin System
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Homebrew
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };

    # NvChad
    nvchad4nix = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nix-darwin,
    home-manager,
    nix-homebrew,
    ...
  }: let
    # Common Settings for all systems
    shared = {
      username = "deishuu";
      useremail = "william.r2409@gmail.com";
    };

    hosts = {
      laptop = {
        hostname = "laptop";
        system = "aarch64-darwin";
        builder = nix-darwin.lib.darwinSystem;
        modules = [
          ./hosts/nix-core.nix
          ./hosts/host-users.nix
          ./hosts/laptop/configuration.nix
          ./hosts/laptop/homebrew.nix
          nix-homebrew.darwinModules.nix-homebrew
          home-manager.darwinModules.home-manager
        ];
      };
      desktop = {
        hostname = "desktop";
        system = "x86_64-linux";
        builder = nixpkgs.lib.nixosSystem;
        modules = [
          ./hosts/nix-core.nix
          ./hosts/host-users.nix
          home-manager.nixosModules.home-manager
        ];
      };
    };

    baseConfig = {hostname, ...}: {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = {
          inherit (shared) username useremail;
          inherit hostname;
        };
        users.${shared.username} = import ./modules;
      };
    };
  in {
    # MacOS Configuration
    darwinConfigurations = {
      laptop = hosts.laptop.builder {
        system = hosts.laptop.system;
        specialArgs =
          {
            inherit inputs;
            hostname = hosts.laptop.hostname;
          }
          // shared;
        modules = hosts.laptop.modules ++ [{imports = [baseConfig];}];
      };
    };
    # NixOS Configuration
    nixosConfigurations = {
      desktop = hosts.desktop.builder {
        system = hosts.desktop.system;
        specialArgs =
          {
            inherit inputs;
            hostname = hosts.desktop.hostname;
          }
          // shared;
        modules = hosts.desktop.modules ++ [{imports = [baseConfig];}];
      };
    };
  };
}
