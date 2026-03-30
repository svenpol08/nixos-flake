{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    heroic
    deadlock-mod-manager
  ];
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };
}
