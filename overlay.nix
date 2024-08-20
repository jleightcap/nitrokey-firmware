final: prev: {
  nitrokey-3 = prev.callPackage ./devices/nitrokey-3.nix { };
  nitrokey-fido2 = prev.callPackage ./devices/nitrokey-fido2.nix { };
  nitrokey-pro = prev.callPackage ./devices/nitrokey-pro.nix { };
  nitrokey-start = prev.callPackage ./devices/nitrokey-start.nix { };
  nitrokey-storage = prev.callPackage ./devices/nitrokey-storage.nix { };
  nitrokey-trng-rs232 = prev.callPackage ./devices/nitrokey-trng-rs232.nix { };
}
