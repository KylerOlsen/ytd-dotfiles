{

  description = "Kyler Olsen's flake";

  input = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
  };

  output = { self, nixpkgs, ... } :
  let
    lib = nixpkgs.lib;
  in {
  	nixosConfigurations = {
  	  nixos-ytd = lib.nixosSystem {
  	  	system = "x86_64-linux";
  	  	modules = [ ./configuration.nix ];
  	  };
  	};
  };

}
