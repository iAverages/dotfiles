{
  settings,
  config,
  ...
}: {
  imports = [
    ./environment
    ./packages
    ./services
    ./security
  ];

  xdg.configFile."environment.d/envvars.conf" = {
    text = ''
      PATH="${config.home.homeDirectory}/.nix-profile/bin:$PATH";
    '';
  };

  home.username = settings.user;
  home.homeDirectory = "/home/${settings.user}";

  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
