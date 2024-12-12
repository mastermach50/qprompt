{
  pkgs ? import <nixpkgs> { },
}:
pkgs.callPackage ./build.nix { }

