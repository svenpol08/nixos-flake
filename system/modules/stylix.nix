{ pkgs, ... }:
{
    stylix = {
        enable = true;
        icons.enable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";
        image = /home/noow33/nixos-flake/wallpapers/wallpaperflare.com_wallpaper.jpg;
        polarity = "dark";
        targets.spicetify.colors.enable = false;
        opacity.terminal = 0.5;
    };
}
