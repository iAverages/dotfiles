{...}: {
  # Configuration specific to this machine

  # Set hostname of the machine
  networking.hostName = "izanami";

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
