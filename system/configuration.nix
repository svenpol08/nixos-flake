{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules
  ];
  
  services = {
    xserver.xkb = {
      layout = "us";
      variant = "";
    };
  };

  security.sudo.wheelNeedsPassword = false;

  environment.systemPackages = with pkgs; [
    pfetch-rs
    fastfetch
    htop
    gh
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-cove
    nerd-fonts.iosevka-term
  ];

  system.stateVersion = "25.11";
}
