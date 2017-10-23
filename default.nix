{ pkgs ? import <nixpkgs> {} }: {
  asql = pkgs.callPackage ./asql.nix {};
}
