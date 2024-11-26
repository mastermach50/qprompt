# shell.nix for qprompt
{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "qprompt";
  packages = with pkgs; [
    cargo
    rustc
    rustfmt
  ];

  LD_LIBRARY_PATH = with pkgs; pkgs.lib.makeLibraryPath [
    wayland
    libxkbcommon
  ];

  RUST_BACKTRACE = 1;
}

