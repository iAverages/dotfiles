{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  pname = "abby";
  version = "0.5.4";

  src = /home/dan/Downloads/abby/bundle/deb;

  buildInputs = [pkgs.webkitgtk]; # Add webkitgtk to the build inputs

  installPhase = ''
    mkdir -p $out/
    cp -r * $out/
  '';

  meta = with pkgs; {
    description = "abby";
    platforms = lib.platforms.linux;
  };
}
