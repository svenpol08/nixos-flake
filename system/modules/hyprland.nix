{ config, pkgs, ... }:

{
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    mpd
    mpc
    hyprpaper
    firefox
    alacritty
    libnotify
    playerctl
    wl-clipboard
    wofi
    waybar
    qt5.qtwayland
    qt6.qtwayland
    mako
    hyprshot
  ];
}
