{ config, pkgs, pkgs-unstable, inputs, ... }:

{
	imports = [ 
		./hardware-configuration.nix
		./modules
	];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "nixos";
	networking.networkmanager.enable = true;

 	services = {
		xserver.xkb = {
   			layout = "us";
    			variant = "";};
	};
	
	security.sudo = {
		wheelNeedsPassword = false;
	};

  	environment.systemPackages = with pkgs; [
		firefox
		pfetch-rs
		fastfetch
		heroic
		btop
		gh
		zsh-powerlevel10k
		alacritty
		tmux
	];

	fonts.packages = with pkgs; [
		nerd-fonts.caskaydia-cove
	];

 	programs = {
		zsh = {
			enable = true;
			enableCompletion = true;
			autosuggestions.enable = true;
			promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
			shellAliases = {
				rebuild = "sudo nixos-rebuild switch --flake ~/nixos-flake#noow33 && home-manager switch --flake ~/nixos-flake#noow33";
			};
			ohMyZsh = {
				enable = true;
				plugins = [ "git" "dirhistory" ];
			};
		};
	};

 	system.stateVersion = "25.11";
}
