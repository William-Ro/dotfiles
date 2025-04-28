{
  description = "deishuu macos/nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

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
        homes.deishuu-nixos = ./homes/deishuu-nixos;
        hosts.desktop = ./hosts/desktop;
      };
      aarch64-darwin = {
        homes.deishuu-macos = ./homes/deishuu-macos;
        hosts.laptop = ./hosts/laptop;
      };
    };
}
