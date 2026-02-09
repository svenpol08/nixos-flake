{
	imports = [
		./config.nix
	];

	nixpkgs.config = {
		allowUnfree = true;
	};
}
