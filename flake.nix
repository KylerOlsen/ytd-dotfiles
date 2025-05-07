{

  description = "Kyler Olsen's flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs, ... } :
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
