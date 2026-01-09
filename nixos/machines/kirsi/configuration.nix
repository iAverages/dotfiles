{
  pkgs,
  config,
  ...
}: {
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  hardware.nvidia.open = false;
  services.xserver.videoDrivers = ["nvidia"];

  programs.streamcontroller.enable = true;

  programs.coolercontrol.enable = true;

  networking.hostName = "kirsi";
  networking.firewall = {
    allowedTCPPorts = [3000 3001 22];
  };

  fileSystems."/mnt/games" = {
    device = "/dev/disk/by-uuid/14C4A611C4A5F560";
    fsType = "ntfs3";
    options = ["uid=1000" "nofail"];
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

  hardware.sane.enable = true;
  users.users.dan.extraGroups = ["scanner" "lp"];

  boot.tmp.useTmpfs = true;

  environment.systemPackages = with pkgs; [
    xclip
  ];
}
