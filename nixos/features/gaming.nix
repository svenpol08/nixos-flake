{ self, inputs, ... }:
{
  flake.nixosModules.gaming =
    { pkgs, ... }:
    { 
      imports = [ self.nixosModules.shadps4 ];
      environment.systemPackages = with pkgs; [
        heroic
        prismlauncher
        gamescope
      ];
      programs = {
        steam = {
          enable = true;
          remotePlay.openFirewall = true;
          dedicatedServer.openFirewall = true;
        };
        shadps4.enable = true;
      };
      hardware.graphics.enable = true;
    };
}
