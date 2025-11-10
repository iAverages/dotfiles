{
  programs.atuin = {
    enable = true;
    daemon.enable = true;
    settings = {
      sync.records = true;
      sync_frequency = "1";
      auto_sync = true;
      sync_address = "https://atuin.dan.local";
    };
  };
}
