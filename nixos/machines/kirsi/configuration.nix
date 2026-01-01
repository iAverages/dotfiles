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
      limine = {
        enable = true;
        maxGenerations = 10;
        secureBoot = {
          enable = true;
        };
        extraConfig = ''
          remember_last_entry: yes
        '';
        extraEntries = ''
          /Windows
            protocol: efi
            path: uuid(27f1d4c8-a7d2-4728-8a89-5cc298c0b642):/EFI/Microsoft/Boot/bootmgfw.efi
        '';
      };
    };
  };

  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "no";
  services.auth-usb-mount.enable = false;

  boot.tmp.useTmpfs = true;

  environment.systemPackages = with pkgs; [
    xclip
  ];
}
