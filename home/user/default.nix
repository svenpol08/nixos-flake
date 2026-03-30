{
  imports = [
    ./config.nix
    ./nixcord.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };
}
