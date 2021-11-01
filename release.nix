{ lib
, stdenv
, libcxxClang
}:

stdenv.mkDerivation {
  pname = "hello";
  version = "0.0.1";
  src = ./.;
  buildInputs = [ libcxxClang ];
  buildPhase = ''
    c++ app.cpp -o ./hello -Wl,-lc++ -stdlib=libc++ -std=c++14
  '';
  installPhase = ''
    mkdir -p $out/bin
    install ./hello $out/bin/hello
  '';
}
