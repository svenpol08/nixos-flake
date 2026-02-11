{ config, pkgs, ... }:

{
	users.users.noow33 = {
		description = "noow33";
		isNormalUser = true;
		shell = pkgs.zsh;
		extraGroups = [ "networkmanager" "wheel" ];
	};
}
