{
  lib,
  rustPlatform,
  fetchFromGitHub,
  libxkbcommon,
  wayland,
}:

rustPlatform.buildRustPackage {
  pname = "qprompt";
  version = "0.1.1";

  src = fetchFromGitHub {
    owner = "mastermach50";
    repo = "qprompt";
    rev = "c6a8c4becc29b3768dd7dd679d538e007856081b";
    hash = "sha256-RyqigNJixtsv7jhqdzcKZyjyI4f0LQz/qjZTxuhfW50=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-J29jP6tCkyOj+Le2d5nteGp25Br9OVi1GlvYpuVR/dE=";

  postFixup = ''
    patchelf $out/bin/qprompt \
      --add-rpath ${
        lib.makeLibraryPath [
          libxkbcommon
          wayland
        ]
      }
  '';

  meta = {
    description = "A GUI app to fetch input from user, for use in scripts";
    platforms = [ "x86_64-linux" ];
  };
}
