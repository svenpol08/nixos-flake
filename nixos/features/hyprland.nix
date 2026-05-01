{ self, inputs, ... }:
{
  flake.nixosModules.hyprland =
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

      fonts.packages = with pkgs; [
        nerd-fonts.caskaydia-cove
        nerd-fonts.iosevka-term
      ];
    };
}
