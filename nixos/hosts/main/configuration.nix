{
  inputs,
  self,
  ...
}:
{
  flake.nixosConfigurations.main = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.hostMain
      self.nixosModules.hardware-main
      self.nixosModules.user-noow33
      self.nixosModules.network-main
      self.nixosModules.locale-nl
      self.nixosModules.llm
      self.nixosModules.hyprland
      self.nixosModules.nixsettings
      self.nixosModules.sound
      self.nixosModules.spotify
      self.nixosModules.shell
      self.nixosModules.nvf
    ];
  };

  flake.nixosModules.hostMain =
    { pkgs, ... }:
    {
      boot.kernelPackages = pkgs.linuxPackages_zen;
      security.sudo.wheelNeedsPassword = false;
      networking = {
        hostName = "main";
        networkmanager.enable = true;
      };

      hardware.cpu.amd.updateMicrocode = true;
      xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      xdg.portal.enable = true;
      hardware.graphics.enable = true;
      networking.firewall.enable = false;
      programs.appimage.enable = true;
      programs.appimage.binfmt = true;
      services.xserver.videoDrivers = [ "amdgpu" ];
      boot.initrd.kernelModules = [ "amdgpu" ];
      system.stateVersion = "25.11";
    };
}
