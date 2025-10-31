{
  pkgs,
  config,
  ...
}: {
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  hardware.nvidia.open = false;
  services.xserver.videoDrivers = ["nvidia"];

  programs.coolercontrol.enable = true;

  networking.hostName = "kirsi";
  networking.firewall = {
    allowedTCPPorts = [3000 3001 22];
  };

  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        devices = ["nodev"];
        efiSupport = true;
        useOSProber = true;
        default = "saved";
        theme = "${pkgs.kdePackages.breeze-grub}/grub/themes/breeze";
      };
    };
  };

  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "no";

  boot.tmp.useTmpfs = true;

  environment.systemPackages = with pkgs; [
    xclip
  ];

  # config.environment.terminal = {
  #   enable = true;
  #   program = "ghostty";
  # };
  #
  # config.environment.wallpaper.enable = false;
}
