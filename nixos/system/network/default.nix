{
  imports = [
    ./dns.nix
    ./firewall.nix
  ];

  networking.networkmanager = {
    enable = true;
    dns = "none"; # prevents networkmanager from managing DNS
  };
}
