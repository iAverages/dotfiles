{
  pkgs,
  lib,
  config,
  ...
}: {
  # Enable flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Bootloader.
  boot.kernelPackages = pkgs.linuxPackages_6_14;

  # Something something fixes libraries
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # Enable networking
  networking.networkmanager = {
    enable = true;
    dns = "none"; # prevents networkmanager from managing DNS
  };

  # fix: for whatever reason my ips dns is being included in config, first
  environment.etc = {
    "resolv.conf".text = "nameserver 1.1.1.1\n";
  };

  networking.extraHosts = ''
    192.168.1.179 ctr.dan.local
    192.168.1.179 git.dan.local
  '';

  networking.firewall.allowedTCPPorts = [9003];

  # Use local dns server
  # networking.nameservers = ["192.168.1.179" "1.1.1.1"];

  # Workaround for SuspendThenHibernate: https://lore.kernel.org/linux-kernel/20231106162310.85711-1-mario.limonciello@amd.com/
  boot.kernelParams = lib.optionals (lib.versionOlder config.boot.kernelPackages.kernel.version "6.8") ["rtc_cmos.use_acpi_alarm=1"];

  # Enable virtualbox
  virtualisation.virtualbox.host.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
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

  nix.settings.auto-optimise-store = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
