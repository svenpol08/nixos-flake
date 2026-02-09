{
	description = "main nix flake";

	inputs = {
		nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs-unstable";
		};
	};
	
	outputs = inputs:
	{
		nixosConfigurations.noow33 = inputs.nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [ ./system/configuration.nix ];
			specialArgs = { inherit inputs; };
		};

		homeConfigurations.noow33 = inputs.home-manager.nixpkgs.lib.homeManagerConfiguration {
			pkgs = "inputs.nixpkgs.legacyPackages.x86_64-linux";
			modules = [ ./home ];
			extraSpecialArgs = { inherit inputs; };
		};
	};
}
