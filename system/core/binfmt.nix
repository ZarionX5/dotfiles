{
  boot.binfmt = {
    preferStaticEmulators = true;

    emulatedSystems = [
      "armv7l-linux"
      "aarch64-linux"
      "riscv64-linux"
      "i686-linux"
      "mipsel-linux"
      "powerpc64le-linux"
    ];
    registrations = {
      armv7l-linux.fixBinary = true;
      aarch64-linux.fixBinary = true;
    };
  };
}
