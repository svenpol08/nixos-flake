{ pkgs, ... }:
{
    stylix = {
        enable = true;
        icons.enable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";
        image = ./../../wallpapers/wallpaperflare.com_wallpaper.jpg;
        polarity = "dark";
        targets.spicetify.colors.enable = false;
    };
}
