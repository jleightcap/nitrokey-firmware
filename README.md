# Status as of 29/08/2024
5 out of 6 devices have open PRs on NixOS/nixpkgs.

- [GH-337966](https://github.com/NixOS/nixpkgs/pull/337966)
- [GH-337959](https://github.com/NixOS/nixpkgs/pull/337959)
- [GH-337956](https://github.com/NixOS/nixpkgs/pull/337956)
- [GH-337954](https://github.com/NixOS/nixpkgs/pull/337954)
- [GH-337951](https://github.com/NixOS/nixpkgs/pull/337951)


For nitrokey-3, the rust-overlay is needed to pull an adequate version of the nightly toolchain.
However, rust-overlay cannot be used inside nixpkgs because it is a flake.nix.
And using a nightly toolchain is frowned upon because of the maintenance burden.

# Nix flake for building firmware images for Nitrokey devices

This repository provides build instructions for all nitrokey firmware images for [Nix](https://nixos.org/),
the reproducible package manager.
For building them,
you need the Nix package manager with Flakes support.
If your Nix version is lower than 3,
see [the NixOS wiki](https://nixos.wiki/wiki/Flakes#Enable_flakes) for how to enable Flakes support.

## Supported devices

 * [Nitrokey 3](https://github.com/Nitrokey/nitrokey-3-firmware)
 * [Nitrokey FIDO2](https://github.com/Nitrokey/nitrokey-fido2-firmware)
 * [Nitrokey Pro](https://github.com/Nitrokey/nitrokey-pro-firmware)
 * [Nitrokey Start](https://github.com/Nitrokey/nitrokey-start-firmware)
 * [Nitrokey Storage](https://github.com/Nitrokey/nitrokey-storage-firmware)
 * [Nitrokey TRNG RS232](https://github.com/nitrokey/nitrokey-trng-rs232-firmware)

While the firmware builds successfully for all these devices,
they haven’t been tested on real hardware yet.
If you own a device and the firmware built by this does not work on your hardware,
but officially built firmware does,
please open an issue.

## How to build

In the repository root, run a command like the following:

```shell
nix build .#nitrokey-3
```

You can find the firmware in `./result/`.

To see a list of the names for all targets,
run `nix flake show`.

Please note, that currently only `x86_64-linux` is supported for building.

## License

The build expressions are available under the MIT License (see [LICENSE](LICENSE) for details) unless noted otherwise.
Please note that this might not apply to build artifacts and patches.
