{
  pkgs,
  config,
  ...
}: {
  imports = [
    ../../system/wm/hyprland.nix
  ];
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  hardware.nvidia.open = false;
  services.xserver.videoDrivers = ["nvidia"];

  networking.hostName = "kirsi";

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

  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "no";

  boot.tmp.useTmpfs = true;

  environment.systemPackages = with pkgs; [
    xclip
  ];
}
