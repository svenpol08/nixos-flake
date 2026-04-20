{ pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules
  ];

  security.sudo.wheelNeedsPassword = false;

  environment.systemPackages = with pkgs; [
    pfetch-rs
    fastfetch
    htop
    gh
    gitlogue
    mpv
  ];
  
  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-cove
    nerd-fonts.iosevka-term
  ];
  
  system.stateVersion = "25.11";
}
