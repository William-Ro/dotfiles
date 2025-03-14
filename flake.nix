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
    # User Configuration
    username = "deishuu"; # Change this to your username
    useremail = "deishuu666@gmail.com"; # Change this to your email
  in {
    # MacOS Configuration
    darwinConfigurations.laptop = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin"; # ARM para MacBook
      specialArgs = {
        inherit username useremail inputs;
        hostname = "laptop";
      };
      modules = [
        # System Configuration
        ./hosts/nix-core.nix
        ./hosts/host-users.nix
        ./hosts/laptop/configuration.nix
        ./hosts/laptop/homebrew.nix

        # Home Manager
        home-manager.darwinModules.home-manager
        ({
          config,
          pkgs,
          specialArgs,
          ...
        }: {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = specialArgs;
          home-manager.backupFileExtension = "bak";
          home-manager.users.${specialArgs.username} = import ./modules;
        })

        # Homebrew
        nix-homebrew.darwinModules.nix-homebrew
      ];
    };
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux"; # x86 para desktop
      specialArgs = {
        inherit username useremail inputs;
        hostname = "desktop";
      };
      modules = [
        # System Configuration
        ./hosts/nix-core.nix
        ./hosts/host-users.nix
        ./hosts/desktop/configuration.nix
        ./hosts/desktop/hardware-configuration.nix

        # Home Manager
        home-manager.nixosModules.home-manager
        ({
          config,
          pkgs,
          specialArgs,
          ...
        }: {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = specialArgs;
          home-manager.backupFileExtension = "bak";
          home-manager.users.${specialArgs.username} = import ./modules;
        })
      ];
    };
  };
}
