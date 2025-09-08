{
  config = {
    programs.vesktop = {
      enable = true;
      settings = {
        frameless = true;
        autoUpdate = false;
        autoUpdateNotification = false;
        notifyAboutUpdates = false;
      };
    };
  };
}
