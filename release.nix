{ lib
, stdenv
}:

stdenv.mkDerivation {
  pname = "hello";
  version = "0.0.1";
  src = ./.;
  buildPhase = ''
    c++ app.cpp -o ./hello -lc++ -stdlib=libc++ -std=c++17
  '';
  installPhase = ''
    mkdir -p $out/bin
    install ./hello $out/bin/hello
  '';
}
