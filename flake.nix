{
	description = "main nix flake";

	inputs = {
		nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
		nvf.url = "github:notashelf/nvf";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};
	
	outputs = inputs @ { self, nixpkgs, nixpkgs-unstable, home-manager, nvf, ... }:
	let
		lib = nixpkgs.lib;
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
        	pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
	in
	{
		nixosConfigurations.noow33 = lib.nixosSystem {
			inherit system;
			specialArgs = { inherit pkgs-unstable; };
			modules = [ 
				./system/configuration.nix
				nvf.nixosModules.default
			];
		};
		homeConfigurations = {
			"noow33" = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				modules = [ ./home ];
                		extraSpecialArgs = {
                    			inherit pkgs-unstable;
                		};
			};
		};
	};
}
