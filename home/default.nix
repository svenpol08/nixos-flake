{ pkgs, inputs, ... }:

{
	imports = [ ./user ];
	home.username = "noow33";
	home.homeDirectory = "/home/noow33";
	home.stateVersion = "25.11";
	home.enableNixpkgsReleaseCheck = false;

	programs.home-manager.enable = true;
}
