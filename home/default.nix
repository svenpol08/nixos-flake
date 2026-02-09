{ inputs, ... }:

{
	imports = [ ./user ];
	home.username = "noow33";
	home.homeDirectory = "/home/noow33";
	home.stateVersion = "25.11";
}
