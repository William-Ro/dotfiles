{
  description = "deishuu macos/nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    import ./lib/bootstrap.nix inputs {
      x86_64-linux = {
        homes.desktop = ./homes/desktop;
        hosts.desktop = ./hosts/desktop;

        homes.server = ./homes/server;
        hosts.server = ./hosts/server;
      };
      aarch64-darwin = {
        homes.laptop = ./homes/laptop;
        hosts.laptop = ./hosts/laptop;
      };
    };
}
