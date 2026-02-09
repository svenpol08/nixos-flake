{
	imports = [
		./config.nix
	];

	imports.nixpkgs.config = {
		allowUnfree = true;
	};
}
