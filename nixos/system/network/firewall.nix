{...}: {
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [3000 3001 22];
  };
}
