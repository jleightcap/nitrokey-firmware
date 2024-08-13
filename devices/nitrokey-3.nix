{ lib, rustPlatform, fetchFromGitHub, fetchpatch, cargo-binutils, flip-link, gcc-arm-embedded, llvmPackages, board ? "nk3xn", provisioner ? false, develop ? false }:

rustPlatform.buildRustPackage rec {
  pname = "nitrokey-3-firmware";
  version = "1.7.2";

  src = fetchFromGitHub {
    owner = "Nitrokey";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-zl3kSgMJrfn7RAN3sabZvCp6hqWc2Ffma29KL5eP6kg=";
  };

  nativeBuildInputs = [ cargo-binutils flip-link gcc-arm-embedded ];

  cargoLock = {
    lockFile = "${src}/Cargo.lock";
    outputHashes = {
      "fido-authenticator-0.1.0" = "sha256-sOYuAus1IBFDaD2LGpqENLCtTsaWS90aEqsjjA1Spkg=";
      "trussed-0.1.0" = "sha256-2Gl+f6meuskCM4XkKeHNwKVUu0LhBpyuDyOPvJ/aibM=";
    };
  };

  dontCargoBuild = true;
  dontCargoInstall = true;
  doCheck = false;

  makeFlags = [ "objcopy" "BOARD=${board}" "PROVISIONER=${toString provisioner}" "DEVELOP=${toString develop}" ];

  "CC_thumbv8m.main-none-eabi" = "arm-none-eabi-gcc";
  LIBCLANG_PATH = "${llvmPackages.libclang.lib}/lib";

  installPhase = ''
    runHook preInstall
    mkdir $out
    cp ${if provisioner then "provisioner" else "firmware"}-${board}${lib.optionalString develop "-develop"}.bin $out/
    runHook postInstall
  '';

  meta = with lib; {
    description = "Firmware for the Nitrokey 3 device";
    homepage = "https://github.com/Nitrokey/nitrokey-3-firmware";
    license = with licenses; [ asl20 mit ];
  };
}
