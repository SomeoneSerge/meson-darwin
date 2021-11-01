{ lib
, stdenv
}:

stdenv.mkDerivation {
  pname = "hello";
  version = "0.0.1";
  src = ./.;
  buildPhase = ''
    c++ app.cpp -lstdc++ -o ./hello -std=c++17
  '';
  installPhase = ''
    mkdir -p $out/bin
    install ./hello $out/bin/hello
  '';
}
