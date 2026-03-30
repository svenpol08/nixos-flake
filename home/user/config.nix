let
  configDir = ../config;
in
{
  home.file = {
    ".config/hypr/".source = "${configDir}/hypr";
    ".config/waybar/".source = "${configDir}/waybar";
    ".config/alacritty/".source = "${configDir}/alacritty";
  };
}
