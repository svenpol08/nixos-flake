{ self, inputs, ... }:
{
  flake.nixosModules.network-main =
    {
      pkgs,
      lib,
      config,
      ...
    }:
    let
      shadps4 = pkgs.fetchurl {
        url = "https://github.com/diegolix29/shadPS4/releases/download/Shadlix-shadPS4-2026-04-30-a033cd23337ce430ee3a38f5e8d41d45b6253e5b/Shadlix-shadps4-linux-qt-2026-04-30-a033cd2.zip";
        hash = "sha256-s7xeIaxxS5VqTS2qiV8V03AB3SM+oNT6ImOqY43PgaE=";
      };

      shadps4Unpacked =
        pkgs.runCommand "shadps4-unpacked"
          {
            nativeBuildInputs = [ pkgs.unzip ];
          }
          ''
            mkdir -p $out/bin
            unzip ${shadps4} -d $out/bin
            chmod +x $out/bin/Shadps4-qt.AppImage
          '';

      shadps4Package = pkgs.writeShellScriptBin "shadps4" ''
        export RADV_DEBUG=nodynamicds,hang
        exec ${pkgs.appimage-run}/bin/appimage-run ${shadps4Unpacked}/bin/Shadps4-qt.AppImage "$@"
      '';

      shadps4Desktop = pkgs.makeDesktopItem {
        name = "shadps4";
        desktopName = "shadPS4";
        comment = "PlayStation 4 Emulator";
        exec = "shadps4";
        icon = "applications-games"; # You can replace with a custom icon path
        categories = [
          "Game"
          "Emulator"
        ];
        terminal = false;
      };
    in
    {
      options.programs.shadps4 = {
        enable = lib.mkEnableOption "shadPS4 PS4 emulator";
      };

      config = lib.mkIf config.programs.shadps4.enable {
        environment.systemPackages = [
          shadps4Package
          shadps4Desktop
        ];
      };
    };
}
