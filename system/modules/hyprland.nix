{ config, pkgs, ... }:

{
	programs.hyprland.enable = true;

	environment.systemPackages = with pkgs; [
		hyprpaper
		libnotify
		wl-clipboard
		wofi
		waybar
		qt5.qtwayland
		qt6.qtwayland
		mako
                hyprshot
	];
}
