{
	description = "main nix flake";

	inputs = {
		nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
		home-manager = {
			url = "github:nix-community/home-manager/release-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
		nvf = {
			url = "github:NotAShelf/nvf";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};
	
	outputs = inputs @ { self, nixpkgs, nixpkgs-unstable, home-manager, neovim-nightly-overlay, ... }:
	let
		lib = nixpkgs.lib;
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
        pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
	in
	{
		nixosConfigurations.noow33 = lib.nixosSystem {
			inherit system;
			specialArgs = { inherit pkgs-unstable; inherit inputs; };
			modules = [ 
				inputs.nvf.nixosModules.default
				./system/configuration.nix
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
