{
  imports = [
    ./dns.nix
    ./firewall.nix
    ./tailscale.nix
  ];

  networking.networkmanager = {
    enable = true;
    dns = "none"; # prevents networkmanager from managing DNS
  };
}
