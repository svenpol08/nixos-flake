{ pkgs, ... }:

{
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    hyprpaper
    firefox
    alacritty
    libnotify
    playerctl
    wl-clipboard
    wofi
    rofi
    waybar
    qt5.qtwayland
    qt6.qtwayland
    mako
    hyprshot
    cava
  ];
}
