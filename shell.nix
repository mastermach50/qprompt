# shell.nix for qprompt
{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  name = "qprompt";
  buildInputs = with pkgs; [
    cargo
    rustc
    rustfmt
    rust-analyzer
    pkg-config
  ];
  nativeBuildInputs = with pkgs; [
    wayland
    libxkbcommon
  ];

  RUST_BACKTRACE = 1;
  # RUSTFLAGS = "-C target-feature=+crt-static";
}
