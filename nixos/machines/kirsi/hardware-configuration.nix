# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "ahci" "usbhid" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-amd"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/5c82288a-0f0a-48d4-b97e-d00d10a93939";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/7062-904C";
    fsType = "vfat";
    options = ["fmask=0022" "dmask=0022"];
  };

  fileSystems."/mnt/windows" = {
    device = "/dev/disk/by-uuid/76E8D73BE8D6F877";
    fsType = "ntfs";
  };

  fileSystems."/mnt/chonky" = {
    device = "/dev/disk/by-uuid/E85E1C125E1BD7E0";
    fsType = "ntfs";
  };

  fileSystems."/mnt/flushed" = {
    device = "/dev/disk/by-uuid/14C4A611C4A5F560";
    fsType = "ntfs";
  };

  swapDevices = [];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-000075234d9e.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-907985c972e2.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-dc09fa6c5bed.useDHCP = lib.mkDefault true;
  # networking.interfaces.docker0.useDHCP = lib.mkDefault true;
  # networking.interfaces.docker_gwbridge.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp7s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.vboxnet0.useDHCP = lib.mkDefault true;
  # networking.interfaces.veth19eeebc.useDHCP = lib.mkDefault true;
  # networking.interfaces.veth3e7e064.useDHCP = lib.mkDefault true;
  # networking.interfaces.vethd4dab3b.useDHCP = lib.mkDefault true;
  # networking.interfaces.vetheca5e9a.useDHCP = lib.mkDefault true;
  # networking.interfaces.vethfbbe427.useDHCP = lib.mkDefault true;
  # networking.interfaces.vethfe0ab3b.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp6s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
