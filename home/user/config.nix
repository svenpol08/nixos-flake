let
  configDir = ../config;
in
{
  home.file = {
    ".config/waybar/".source = "${configDir}/waybar";
    ".config/alacritty/".source = "${configDir}/alacritty";
  };
}
