{ self, inputs, ... }:
{
  flake.nixosModules.network-main =
    { pkgs, ... }:
    {
      networking.networkmanager.enable = true;
      networking.hostName = "main";
    };
}
