{ config, pkgs, inputs, ... }:

{
	imports = [ 
		./hardware-configuration.nix
		./modules
	];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "nixos";
	networking.networkmanager.enable = true;
	
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	time.timeZone = "Europe/Amsterdam";

	i18n = {
		defaultLocale = "en_US.UTF-8";
		extraLocaleSettings = {
			LC_ADDRESS = "nl_NL.UTF-8";
			LC_IDENTIFICATION = "nl_NL.UTF-8";
			LC_MEASUREMENT = "nl_NL.UTF-8";
			LC_MONETARY = "nl_NL.UTF-8";
			LC_NAME = "nl_NL.UTF-8";
			LC_NUMERIC = "nl_NL.UTF-8";
			LC_PAPER = "nl_NL.UTF-8";
			LC_TELEPHONE = "nl_NL.UTF-8";
			LC_TIME = "nl_NL.UTF-8";
		};};

 	services = {
		xserver.xkb = {
   			layout = "us";
    			variant = "";};
	};
	
	security.sudo = {
		wheelNeedsPassword = false;
	};

  	users.users.noow33 = {
    		isNormalUser = true;
    		description = "noow33";
    		extraGroups = [ "networkmanager" "wheel" ];
    		packages = with pkgs; [kitty];
		shell = pkgs.zsh;
  	};

  	nixpkgs.config.allowUnfree = true;

  	environment.systemPackages = with pkgs; [
		firefox
		vesktop
		pfetch-rs
		fastfetch
		heroic
		btop
		htop
		wev
		gh
	];

 	programs = {
		neovim = {
			enable = true;
			defaultEditor = true;
		};
		zsh = {
			enable = true;
			enableCompletion = true;
			autosuggestions.enable = true;
			ohMyZsh = {
				enable = true;
				theme = "agnoster";
			};
		};
	};

 	system.stateVersion = "25.11";
}
