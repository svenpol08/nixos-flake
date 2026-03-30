{ ... }:

{
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    warn-dirty = false;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    auto-optimise-store = true;
    substituters = [ "https://nix-gaming.cachix.org" ];
    trusted-public-keys = [ "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4=" ];
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  
  programs.nh = {
    enable = true;
    flake = "/home/noow33/nixos-flake/";
  };

  environment.shellAliases = {
      rebuild = "nh os switch -H noow33 && nh home switch";
      rebuild-home = "nh home switch";
      rebuild-system = "nh os switch -H noow33";
      clean = "nh clean all";
  };
}
