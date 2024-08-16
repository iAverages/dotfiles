{...}: {
  # Configuration specific to this machine

  # Set hostname of the machine
  networking.hostName = "izanami";

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable swap
  swapDevices = [
    {
      device = "/swapfile";
      size = 16 * 1024; # 16GB
    }
  ];
}
