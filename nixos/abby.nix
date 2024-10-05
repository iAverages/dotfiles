{lib, ...}:
lib.stdenv.mkDerivation {
  pname = "abby";
  version = "0.5.4";

  src = /home/dan/Downloads/abby/bundle/deb;

  buildInputs = [lib.webkitgtk]; # Add webkitgtk to the build inputs

  installPhase = ''
    mkdir -p $out/
    cp -r * $out/
  '';

  meta = with lib; {
    description = "abby";
    platforms = platforms.linux;
  };
}
