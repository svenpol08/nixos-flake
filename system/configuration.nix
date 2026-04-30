{ pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules
  ];

  security.sudo.wheelNeedsPassword = false;

  boot.kernelPackages = pkgs.linuxPackages_zen;

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  system.stateVersion = "25.11";
}
