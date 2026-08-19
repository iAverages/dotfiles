{
  services.resolved = {
    enable = true;
    fallbackDns = [""];
  };

  # networking.nameservers = ["1.1.1.1"];
  # networking.networkmanager.settings."global-dns-domain-*" = {
  #   servers = "1.1.1.1";
  # };
  networking.nameservers = ["192.168.1.12"];
  networking.networkmanager.settings."global-dns-domain-*" = {
    servers = "192.168.1.12";
  };
  # networking.dhcpcd.extraConfig = ''
  #   nohook resolv.conf
  # '';

  security.pki.certificateFiles = [../../ssl/ca.crt];
}
