{ lib
, stdenv
, libstdcxxClang
}:

stdenv.mkDerivation {
  pname = "hello";
  version = "0.0.1";
  src = ./.;
  buildInputs = [ libstdcxxClang ];
  buildPhase = ''
    c++ app.cpp -o ./hello -Wl,-lstdc++ -stdlib=libstdc++ -std=c++17
  '';
  installPhase = ''
    mkdir -p $out/bin
    install ./hello $out/bin/hello
  '';
}
