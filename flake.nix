{
  description = "deishuu nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    import ./bootstrap inputs {
      x86_64-linux = {
        homes.desktop = ./homes/desktop;
        hosts.desktop = ./hosts/desktop;
        homes.laptop = ./homes/laptop;
        hosts.laptop = ./hosts/laptop;
      };
    };
}
