let configDir = ../config;
in
{
	home.file = {
		".config/hypr/".force = true;
		".config/hypr/".source = "${configDir}/hypr/";
	};
}
