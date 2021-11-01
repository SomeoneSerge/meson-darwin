{ lib
, stdenv
, pkgconfig
, meson
, ninja
}:

stdenv.mkDerivation {
  pname = "hello";
  version = "0.0.1";
  src = ./.;
  nativeBuildInputs = [ ninja meson pkgconfig ];
  buildInputs = [
  ];

  mesonAutoFeatures = "auto";

  # LDFLAGS = lib.optionalString stdenv.isDarwin "-Wl,-L${libstdcxxClang}/lib -Wl,-L${libcxx}/lib";
  mesonBuildType = "release";
}
