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
    username = "deishuu";
    useremail = "deishuu666@gmail.com";
    system = "aarch64-darwin";
    hostname = "laptop";
    specialArgs = {
      inherit username useremail hostname system inputs;
    };
    extraSpecialArgs = {
      inherit username useremail hostname system inputs;
    };
  in {
    # MacOS Configuration
    darwinConfigurations."${hostname}" = nix-darwin.lib.darwinSystem {
      inherit system specialArgs;
      modules = [
        # System Configuration
        ./hosts/laptop/nix-core.nix
        ./hosts/laptop/host-users.nix
        ./hosts/laptop/configuration.nix
        ./hosts/laptop/homebrew.nix

        # Home Manager
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = extraSpecialArgs;
          home-manager.backupFileExtension = "bak";
          home-manager.users.${username} = import ./modules;
        }

        # Homebrew
        nix-homebrew.darwinModules.nix-homebrew
      ];
    };
  };
}
