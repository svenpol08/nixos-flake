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
		kitty
		tmux
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
			promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
			ohMyZsh = {
				enable = true;
			};
		};
	};

 	system.stateVersion = "25.11";
}
