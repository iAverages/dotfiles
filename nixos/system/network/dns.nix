{
  # fix: for whatever reason my ips dns is being included in config, first
  environment.etc = {
    # "resolv.conf".text = "nameserver 192.168.1.11\n";
    "resolv.conf".text = "nameserver 192.168.1.11\nnameserver 1.1.1.1\n";
  };

  networking.hosts = {
    # "192.168.1.179" = ["ctr.dan.local" "paperless.dan.local"];
  };

  security.pki.certificateFiles = [../../ssl/dan.local.crt];
}
