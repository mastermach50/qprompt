{ pkgs ? import <nixpkgs> {},
}:

pkgs.rustPlatform.buildRustPackage {
  pname = "qprompt";
  version = "0.1.1";
  src = pkgs.lib.cleanSource ./.;

  useFetchCargoVendor = true;
  cargoHash = "sha256-J29jP6tCkyOj+Le2d5nteGp25Br9OVi1GlvYpuVR/dE=";

  postFixup = ''
    patchelf $out/bin/qprompt \
      --add-rpath ${pkgs.lib.makeLibraryPath [ pkgs.libxkbcommon pkgs.wayland ]}
  '';
}
