{
  description = "Figuring out what's wrong with darwin";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.05";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system:
    let
      overlay = (final: prev:
        let callPackage = final.lib.callPackageWith (final // final.llvmPackages_12);
        in
        {
          hello = callPackage ./release.nix { };
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
