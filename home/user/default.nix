{
  imports = [
    ./config.nix
    ./nixcord.nix
    ./hyprland.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };
}
