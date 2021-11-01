{
  description = "Figuring out what's wrong with darwin";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.05";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system:
    let
      overlay = (final: prev: {
        hello = final.callPackage ./release.nix {
          inherit (final.llvmPackages_12) stdenv libstdcxxClang;
        };
      });
      pkgs = import nixpkgs { inherit system; overlays = [ overlay ]; };
    in
    {
      packages = {
        inherit (pkgs) hello;
      };
      defaultPackage = pkgs.hello;
    });
}
