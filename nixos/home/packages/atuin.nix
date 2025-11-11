{
  programs.atuin = {
    enable = true;
    daemon.enable = true;
    settings = {
      sync.records = true;
      sync_frequency = "10m";
      auto_sync = true;
      sync_address = "https://atuin.dan.local";
      dialect = "uk";
      # invert = true;
      inline_height = 32;
    };
  };
}
