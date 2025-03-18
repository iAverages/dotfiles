{...}: {
  services.openvpn.servers = {
    mullvardLondon = {
      config = ''config /home/dan/.openvpn/mullvad_config_linux_gb_lon/mullvad_gb_lon.conf '';
      updateResolvConf = true;
    };
  };
}
