{
  inputs,
  meta,
  ...
}: {
  # Configuration specific to this machine

  imports = [
    inputs.nixos-hardware.nixosModules.framework-16-7040-amd
    ../../system/wm/hyprland.nix
  ];

  # Set hostname of the machine
  networking.hostName = meta.hostname;

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
