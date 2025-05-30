{
  pkgs,
  config,
  ...
}: {
  # Configuration specific to this machine

  imports = [
    ../../system/wm/hyprland.nix
  ];

  # Use the NVIDIA driver
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  hardware.nvidia.open = false;
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
      default = "saved";
    };
  };

  # Enable SSH server
  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "no";

  environment.systemPackages = with pkgs; [
    xclip
  ];
}
