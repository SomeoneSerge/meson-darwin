{ lib
, stdenv
}:

stdenv.mkDerivation {
  pname = "hello";
  version = "0.0.1";
  src = ./.;
  buildInputs = [ ];
  buildPhase = ''
    c++ app.cpp -o ./hello -std=c++17 ${lib.optionalString stdenv.isDarwin "-mmacosx-version-min=10.15"}
  '';
  installPhase = ''
    mkdir -p $out/bin
    install ./hello $out/bin/hello
  '';
}
