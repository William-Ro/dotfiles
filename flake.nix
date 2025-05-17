{
  description = "deishuu macos/nixos configuration";

  nixConfig = {
    extra-substituters = ["https://playit-nixos-module.cachix.org"];
    extra-trusted-public-keys = ["playit-nixos-module.cachix.org-1:22hBXWXBbd/7o1cOnh+p0hpFUVk9lPdRLX3p5YSfRz4="];
  };
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

    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
    playit-nixos-module.url = "github:pedorich-n/playit-nixos-module";
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
