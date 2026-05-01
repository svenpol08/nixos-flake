{ self, inputs, ... }:
{
  flake.nixosModules.nixsettings =
    { pkgs, ... }:
    {
      nixpkgs.config.allowUnfree = true;

      nix.settings = {
        warn-dirty = false;
        experimental-features = [
          "nix-command"
          "flakes"
        ];
        auto-optimise-store = true;
        substituters = [
          "https://nix-gaming.cachix.org"
          "https://cache.nixos.org"
          "https://nix-community.cachix.org"
        ];
        trusted-public-keys = [
          "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        ];
      };

      programs.nh = {
        enable = true;
        flake = "/home/noow33/nixos-flake/";
        clean = {
          enable = true;
          dates = "weekly";
          extraArgs = "--keep 5 --keep-since 3d";
        };
      };

      environment.shellAliases = {
        rebuild = "nh os switch -H main && nh home switch";
        update = "sudo nix flake update --flake ~/nixos-flake && nh home switch --update && nh os boot --update";
        clean = "nh clean all --keep 5 --keep-since 3d";
      };
    };
}
