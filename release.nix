{ lib
, stdenv
, libcxx
, libcxxabi
}:

stdenv.mkDerivation {
  pname = "hello";
  version = "0.0.1";
  src = ./.;
  buildInputs = [ libcxx libcxxabi ];
  buildPhase = ''
    c++ app.cpp -o ./hello -Wl,-lc++ -lc++ -stdlib=libc++ -std=c++14
  '';
  installPhase = ''
    mkdir -p $out/bin
    install ./hello $out/bin/hello
  '';
}
