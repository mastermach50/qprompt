{ pkgs ? import <nixpkgs> }:
let
  lib = pkgs.lib;
  rustPlatform = pkgs.rustPlatform;
  fetchFromGitHub = pkgs.fetchFromGitHub;
  libxkbcommon = pkgs.libxkbcommon;
  wayland = pkgs.wayland;
in
rustPlatform.buildRustPackage rec {
  pname = "qprompt";
  version = "0.1.1";
  
  src = fetchFromGitHub {
    owner = "mastermach50";
    repo = "qprompt";
    rev = "refs/tags/v${version}";
    hash = "sha256-xAXXsb7H7gU0v2Zm0bgo1sQJ8SLB86iwl0j2TcnOaAA=";
  };

  cargoHash = "sha256-J29jP6tCkyOj+Le2d5nteGp25Br9OVi1GlvYpuVR/dE=";
  
  postFixup = ''
    patchelf $out/bin/qprompt \
      --add-rpath ${lib.makeLibraryPath [ libxkbcommon wayland ]}
  '';

  meta = {
    description = "A GUI app to fetch input from user, for use in scripts";
    platforms = [ "x86_64-linux" ];
  };
}