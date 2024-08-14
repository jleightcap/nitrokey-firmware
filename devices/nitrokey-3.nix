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
    # allowBuiltinFetchGit = true;
    outputHashes = {
      "admin-app-0.1.0" = "sha256-yWYdeb6nG7EUBrOECOFiH0foCHgUG2pqhMrdlnaIf8o=";
      "apdu-dispatch-0.1.2" = "sha256-ZADBJR71FIUFUUkDJNswwfEG/cvB6XOALtn0BDfYf6k=";
      "cbor-smol-0.4.0" = "sha256-FcU3oP1KL02ur2O+OCOp/FxmF0DSFgE+jOsNdfh0dPU=";
      "ctap-types-0.1.2" = "sha256-cRgAMmX8F9HsnVAcOizdsmch1CfOPIRmfpxNG39+zLs=";
      "ctaphid-dispatch-0.1.1" = "sha256-6Ryyo8cpaqt9mYjMymak1xy8AEqbeEvDPzXyQZkSw7E=";
      "encrypted_container-0.1.0" = "sha256-1YsmVtDia/to5hjxKYxnEsRsPYxPbDcHdUUa+9ADPR0=";
      "fido-authenticator-0.1.1" = "sha256-tfwPfazXc24y1Y/RejK1jwSo4/94Shkm33FMnpE2cpU=";
      "littlefs2-0.4.0" = "sha256-19UwPy+2/tjW6E3zeTGd5EKK2QD14HjNgabEKXI+Gi0=";
      "littlefs2-sys-0.1.7" = "sha256-F4+mKHftnKSyPuSBFmyArH1+AWW6U7ud9OnUnnjSY/g=";
      "lpc55-hal-0.3.0" = "sha256-8EDsdDxR3p1ez0b9B1AwHX6B8WDYioEFuKaxodwNQak=";
      "opcard-1.4.0" = "sha256-OnKAch3Lad/uSIPcTPCj/R7dvkLE5MwG/r+4oB7U0y0=";
      "p256-cortex-m4-0.1.0-alpha.6" = "sha256-yFswggC3nEE4sBOtLLiFdrPXpdn8oAjGT5GHkj98v/w=";
      "piv-authenticator-0.3.4" = "sha256-LQoEel0tOnoGd9QyTTY0bc6VmgzH5G8xKhWO3VoVv94=";
      "serde-indexed-0.1.0" = "sha256-X+L7pq035cORM7PVUaCscHnbV9EgzAFCRGI9yoo7W8k="; 
      "trussed-0.1.0"  = "sha256-BmTdq8gEjYzQKZgTG7ECbEXiY3aB2i+lP15xPLkBvnI=";
      "trussed-auth-0.3.0" = "sha256-XFcmI2k7OfhUk8/E0TV12vnQqpSuUJ6ahitA1oLt2ws=";
      "trussed-chunked-0.1.0"  = "sha256-Cpz4jeP2xTwMHBWJ/0D5ltCTZxqlD5c43qtxdCTKxok=";
      "trussed-hkdf-0.2.0" = "sha256-VgbG/kuMM2AHE7wQmoOy2vEQ7tBZckZHHIWCH28snlc=";
      "trussed-rsa-alloc-0.1.0"  = "sha256-gFQ2rf7Cx2Fk3EnhzyxYf9KrTwipCo3f2FAnKDhpj2U=";
      "trussed-se050-backend-0.3.0" = "sha256-HqZuUxnkBFt6g7Ix+pnJO/CPPbJFVnGg3ak6UZ8s0Tw=";
      "trussed-se050-manage-0.1.0" = "sha256-6grFxI1zkRwSYIAvlCKzJXtump5zULqOaTVA7AP2VXk";
      "trussed-usbip-0.0.1" = "sha256-jFePfw+WL59SFvORhmpM8zEiay25nIbwdgHgRgYAwoM=";
      "usbd-ccid-0.2.0"  = "sha256-Y/Exbrhb/4QP+zXlGIRRyxpYV2U4d/9ka2rg/NRKEw0=";
      "usbd-ctaphid-0.1.0"   = "sha256-B9jSvi16wYqvLY3O6iIU5QOjNTbf4c6BT2KzcjbJLek=";
      "webcrypt-0.8.0"   = "sha256-uVO9ULh5c98CIkVYIBuqKqXk+vvGPyDVoaxzMjYWnf0=";
      # "fido-authenticator-0.1.0" = "sha256-sOYuAus1IBFDaD2LGpqENLCtTsaWS90aEqsjjA1Spkg=";
      # "trussed-0.1.0" = "sha256-2Gl+f6meuskCM4XkKeHNwKVUu0LhBpyuDyOPvJ/aibM=";
      # "cbor-smol" = "sha256-1ni780cd4y724myvj03miin7rpbv127j0k6lshjp3gjvl1n8wig3";
      # "fido-authenticator" = "sha256-1bwbjpa6ifnp3cb1wwc7p2dxcfld53vb6xr1ybr2k49kk3561qgf";
      # "lpc55-hal" = "sha256-07p0pzj4c2a2q715qm8y2gylsmi3avwg4qab98v3gqxj4qhp0icq";
      # "trussed" = "sha256-0n3myis2hl2r1kphyjq3dvna68rzrf2mr4sfvhna7pk8rrv9pc5f";
      # "apdu-dispatch" = "sha256-1fph3smq8cqkdcnm85c4mflayxs0f26qjdd06m6pkv294wn2mnxm";
      # "ctaphid-dispatch" = "sha256-02d3wb8q7bcq9gdcklrcmfqc96yfcvrffh3zbw7ljdc4d87kwp87";
      # "littlefs2" = "sha256-16sfld9mak8352ldasz6dl8sx7pgp0ivr957k5dkx20mvavin3zh";
      # "littlefs2-sys" = "sha256-08ymq1m58z51ls82r7gz61k7m1nm913j8qcqkca2vvzzl234dmmy";
      # "usbd-ctaphid" = "sha256-1yxcpiiyygvkv5hgad53glk0ki1b40l7lrspw660xq16kn5q4b8p";
      # "usbd-ccid" = "sha256-1cvavmcqz4ir0xbs7mn4viiwvkx2f2nsv3jj65gq29ivxafyvg58";
      # "p256-cortex-m4 " = "sha256-034rwcrc6iwdj155y5sz2fcavpz81v804m8ia2ncfkf7dblwxxr0";
      # "ctap-types" = "sha256-0rnd4agcharg66ilzxaqkj185q2frrd4hx5g24sf24j04rm52qxr";
      # "secrets-app" = "sha256-1cz424rcavw9dw4rbry8m6840f36h5p7aaqcnsdrzvda19widmg5";
      # "webcrypt" = "sha256-0xg8kyrqwx5c4873sj0xddy1ypwckkcx25a7j9hj81pnb26nsp0j";
      # "opcard" = "sha256-1vfglhgxxm4gb5z1l7d2ac77vfwvr1hvn0jh2avkkvw08jr76cnz";
      # "piv-authenticator" = "sha256-165kl34c2qrsi6z5cl1xxb6lyf9dhby5bavml0jpbz9bkxggpzrq";
      # "trussed-fs-info" = "sha256-0pwbfx4mj4plgrrnsapdacs9zvc4pv6acqzfvaqyp5f53kdsqn29";
      # "trussed-chunked" = "sha256-06aq1yhpfqdkblgxz8w3srqyz7gbm3163qm2fx0ji0l0i50y39k6";
      # "trussed-manage" = "sha256-1x6nz922ak2axli760vlh7z2bmhg09dmk5nfmnxnj7vqjk6cplzk";
      # "trussed-wrap-key-to-file" = "sha256-0ih8rpdf0w2g9b8icwrxg80l359a6fyq3v59a1lfbv720f4lsfna";
      # "trussed-staging" = "sha256-0xyh5xyqlsrjj7h10zllbkjpy7knsmzsb8wwhy4pihpyjrjrsfiz";
      # "trussed-auth" = "sha256-1zh8pnizvhxrs9wfy6z6g709l9d8k56bb94sj4k98hv57k70v2qz";
      # "trussed-hkdf" = "sha256-0ghxcigfy76f9qv6rg2ci8mbncw79i2iw7hvi4jv7lxp551ilab6";
      # "trussed-rsa-alloc" = "sha256-18wfrvh93yb0n978rlxz8bld95karl2kzy5gj5jq9c7abhj3i555";
      # "trussed-usbip" = "sha256-0v5cvp9qjv2rjfllfff19mpf3q0x54hpaps7by4m0zy26rhhifh5";
      # "trussed-se050-manage" = "sha256-1gy0il4rg1hy5mxv933j712bwwbnlzkwdrw3m1cszk0r7dlq59vp";
      # "trussed-se050-backend" = "sha256-0dcbj1gi7mgrbaqrkzn0mvkb5kjp5avlafr49wky6waywl5hla6j";
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
