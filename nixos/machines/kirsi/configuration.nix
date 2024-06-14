{config, ...}: {
  # Configuration specific to this machine

  # Use the NVIDIA driver
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  services.xserver.videoDrivers = ["nvidia"];

  # Set hostname of the machine
  networking.hostName = "kirsi";
}
