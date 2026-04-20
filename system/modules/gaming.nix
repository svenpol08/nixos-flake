{ pkgs, inputs, ... }:
{
  imports = [ inputs.self.nixosModules.shadps4 ];
  environment.systemPackages = with pkgs; [
    heroic
    mesa
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
}
