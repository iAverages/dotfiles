{
  imports = [
    # ./boot
    # ./gaming
    ./network
    # ./programs
    ./security
    # ./services
    ./nix.nix
    ./user.nix
  ];

  # options I havent worked out a good place for yet
  boot.initrd.systemd.enable = true;
  # system.disableInstallerTools = true;

  programs.dconf.enable = true;

  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };
}
