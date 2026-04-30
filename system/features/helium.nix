{ pkgs, lib, config, ... }:
let
  helium = pkgs.stdenv.mkDerivation rec {
    pname = "helium";
    version = "0.11.7.1";
    
    src = pkgs.fetchurl {
      url = "https://github.com/imputnet/helium-linux/releases/download/${version}/helium-${version}-x86_64_linux.tar.xz";
      hash = "sha256-V0drAliKB8HFkxDG9I+bPThLH0I/cJpG92v3aORaX/Y=";
    };
    
    nativeBuildInputs = [
      pkgs.autoPatchelfHook
      pkgs.makeWrapper
    ];
    
    buildInputs = with pkgs; [
      stdenv.cc.cc.lib
      alsa-lib
      at-spi2-core
      cairo
      cups
      dbus
      expat
      glib
      gtk3
      libdrm
      libxkbcommon
      mesa
      nspr
      nss
      pango
      systemd
      libX11
      libXcomposite
      libXdamage
      libXext
      libXfixes
      libXrandr
      libxcb
    ];

    dontWrapQtApps = true;
    dontCheckQtModuleImports = true;
    
    autoPatchelfIgnoreMissingDeps = [
      "libQt5Core.so.5"
      "libQt5Gui.so.5"
      "libQt5Widgets.so.5"
      "libQt6Core.so.6"
      "libQt6Gui.so.6"
      "libQt6Widgets.so.6"
    ];

    unpackPhase = ''
      tar xf $src
    '';
    
    installPhase = ''
      mkdir -p $out/opt/helium $out/bin
      cp -r helium-${version}-x86_64_linux/* $out/opt/helium/
      
      makeWrapper $out/opt/helium/helium $out/bin/helium \
        --prefix LD_LIBRARY_PATH : "$out/opt/helium"
    '';
    meta = with lib; {
      description = "Helium web browser";
      homepage = "https://github.com/imputnet/helium-linux";
      platforms = platforms.linux;
    };
  };
in
{
  options.programs.helium = {
    enable = lib.mkEnableOption "helium browser";
  };
  
  config = lib.mkIf config.programs.helium.enable {
    environment.systemPackages = [ helium ];
  };
}
