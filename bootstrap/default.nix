inputs@{
  nixpkgs,
  self,
  ...
}:
systems:
let
  # system agnostic lib with custom extensions
  lib = nixpkgs.lib.extend (import ./lib.nix inputs);

  inherit (lib) foldl recursiveUpdate mapAttrsToList;

  mapSystem =
    system:
    {
      homes ? { },
      hosts ? { },
    }:
    let
      pkgs = nixpkgs.legacyPackages.${system};

      mapHosts = builtins.mapAttrs (
        hostName: path:
        lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit
              inputs
              lib
              self
              system
              hostName
              ;
          };
          modules = [
            path
          ]
          ++ lib.autoloadedModules;
        }
      );

      mapHomes = builtins.mapAttrs (
        homeName: path:
        lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit
              inputs
              lib
              system
              homeName
              ;
          };
          modules = [
            path
          ]
          ++ lib.autoloadedModules;
        }
      );
    in
    {
      formatter.${system} = pkgs.nixfmt;
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          pkgs.nixfmt
          pkgs.home-manager
        ];
        shellHook = ''
          export PS1='\[\e[1;32m\][${system}:\w]\$\[\e[0m\] '
          echo
          echo "‹os›: ${builtins.concatStringsSep ", " (builtins.attrNames hosts)}"
          echo "‹hm›: ${builtins.concatStringsSep ", " (builtins.attrNames homes)}"
          echo

          hm() {
            home-manager switch --flake .#$1
          }

          os() {
            sudo nixos-rebuild switch --flake .#$1
          }
        '';
      };
      nixosConfigurations = mapHosts hosts;
      homeConfigurations = mapHomes homes;
    };

  configuration = foldl recursiveUpdate { } (mapAttrsToList mapSystem systems);
in
configuration
// {
  inherit lib;
}
