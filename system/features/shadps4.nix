{ pkgs, lib, config, ... }:
let
  shadps4 = pkgs.fetchurl {
    url = "https://github.com/diegolix29/shadPS4/releases/download/Shadlix-shadPS4-2026-04-20-fe5b06ffa0c6c7884fda2ef622deebee845c6bf4/Shadlix-shadps4-linux-qt-2026-04-20-fe5b06f.zip";
    hash = "sha256:1a8751219be5b58f812168482a179db24a71bfa0db7d604688858939038d36e9";
  };
  shadps4Unpacked = pkgs.runCommand "shadps4" {
    nativeBuildInputs = [ pkgs.unzip ];
  } ''
    unzip ${shadps4}
    install -Dm755 Shadps4-qt.AppImage $out/bin/shadps4
  '';
in
{
  options.programs.shadps4 = {
    enable = lib.mkEnableOption "shadPS4 PS4 emulator";
  };
  config = lib.mkIf config.programs.shadps4.enable {
    environment.systemPackages = [
      (pkgs.writeShellScriptBin "shadps4" ''
        export RADV_DEBUG=nodynamicds,hang
        exec ${pkgs.appimage-run}/bin/appimage-run ${shadps4Unpacked}/bin/shadps4
      '')
    ];
  };
}
