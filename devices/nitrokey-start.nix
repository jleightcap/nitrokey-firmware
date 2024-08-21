{
  lib,
  stdenv,
  fetchFromGitHub,
  gcc-arm-embedded,
}:

stdenv.mkDerivation rec {
  pname = "nitrokey-start-firmware";
  version = "13";

  src = fetchFromGitHub {
    owner = "Nitrokey";
    # We don't use pname here but follow the patterns here instead
    # https://github.com/NixOS/nixpkgs/pull/240569#discussion_r1249055170
    repo = "nitrokey-start-firmware";
    rev = "RTM.${version}";
    sha256 = "sha256-POW1d/fgOyYa7127FSTCtHGyMWYzKW0qqA1WUyvNc3w=";
    fetchSubmodules = true;
  };

  sourceRoot = "source/src";

  postPatch = ''
    patchShebangs configure
  '';

  configurePlatforms = [ ]; # otherwise additional arguments are added to configureFlags
  # from release/Makefile
  configureFlags = [
    "--target=NITROKEY_START-g"
    "--vidpid=20a0:4211"
    "--enable-factory-reset"
    "--enable-certdo"
  ];

  nativeBuildInputs = [ gcc-arm-embedded ];

  enableParallelBuilding = true;

  installPhase = ''
    runHook preInstall
    mkdir $out
    cp build/gnuk.{bin,hex} $out/
    runHook postInstall
  '';

  meta = with lib; {
    description = "Firmware for the Nitrokey Start device";
    homepage = "https://github.com/Nitrokey/nitrokey-start-firmware";
    license = licenses.gpl3Plus;
  };
}
