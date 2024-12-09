{
  description = "deishuu macOS/nixOS configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

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

    specialArgs =
      inputs
      // {
        inherit username useremail hostname;
      };
  in {
    # Configuración para MacOS
    darwinConfigurations."${hostname}" = nix-darwin.lib.darwinSystem {
      inherit system specialArgs;
      modules = [
        
	./hosts/laptop/nix-core.nix
        ./hosts/laptop/system.nix
	./hosts/laptop/apps.nix
        ./hosts/laptop/host-users.nix	

        # Home Manager
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = specialArgs;
          home-manager.users.${username} = import ./modules;
        }

	# Homebrew
	nix-homebrew.darwinModules.nix-homebrew
	

      ];
    };
  };
}
