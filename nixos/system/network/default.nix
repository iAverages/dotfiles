{
  imports = [
    ./dns.nix
    ./firewall.nix
    ./tailscale.nix
  ];

  networking.networkmanager = {
    enable = true;
    dns = "systemd-resolved";
  };
}
