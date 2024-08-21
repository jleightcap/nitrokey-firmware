final: prev: {
  nitrokey-3-nk3xn = prev.callPackage ./devices/nitrokey-3.nix { board="nk3xn";};
  nitrokey-3-nk3xn-provisioner = prev.callPackage ./devices/nitrokey-3.nix { board="nk3xn"; provisioner=true;};
  nitrokey-3-nkpk = prev.callPackage ./devices/nitrokey-3.nix { board="nkpk";};
  nitrokey-3-nkpk-provisioner = prev.callPackage ./devices/nitrokey-3.nix { board="nkpk"; provisioner=true;};
  nitrokey-3-nk3am = prev.callPackage ./devices/nitrokey-3.nix { board="nk3am";};
  nitrokey-3-nk3am-provisioner = prev.callPackage ./devices/nitrokey-3.nix { board="nk3am"; provisioner=true;};
  nitrokey-fido2 = prev.callPackage ./devices/nitrokey-fido2.nix { };
  nitrokey-pro = prev.callPackage ./devices/nitrokey-pro.nix { };
  nitrokey-start = prev.callPackage ./devices/nitrokey-start.nix { };
  nitrokey-storage = prev.callPackage ./devices/nitrokey-storage.nix { };
  nitrokey-trng-rs232 = prev.callPackage ./devices/nitrokey-trng-rs232.nix { };
}
