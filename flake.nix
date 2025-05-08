{

  description = "Kyler Olsen's flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... } : 
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      moonk4-l = lib.nixosSystem {
        inherit system;
        modules = [ ./sys/configuration.nix ];
      };
    };

    homeConfigurations = {
      kyler = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home/home.nix ];
      };
    };

  };

}
