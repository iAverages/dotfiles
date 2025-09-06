{settings, ...}: {
  imports = [
    ./environment
    ./packages
    ./services
  ];

  home.username = settings.user;
  home.homeDirectory = "/home/${settings.user}";

  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
