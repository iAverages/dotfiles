{
  pkgs,
  config,
  ...
}: {
  # Configuration specific to this machine

  # Use the NVIDIA driver
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  services.xserver.videoDrivers = ["nvidia"];

  # Set hostname of the machine
  networking.hostName = "kirsi";

  # Setup grub to show Windows installation
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = ["nodev"];
      efiSupport = true;
      useOSProber = true;
    };
  };

  # Enable SSH server
  services.openssh.enable = true;
  services.openssh.permitRootLogin = "no";

  environment.systemPackages = with pkgs; [
    xclip
  ];
}
