{
  meta,
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

  programs.rclone = {
    enable = true;
    remotes = {
      kurumi = {
        config = {
          type = "sftp";
          host = "192.168.1.202";
          user = "root";
          key_file = "/home/${settings.user}/.ssh/${meta.hostname}_ed25519";
        };
        mounts = {
          "/opt/data" = {
            enable = true;
            mountPoint = "/home/${settings.user}/nas";
          };
        };
      };
    };
  };

  home.username = settings.user;
  home.homeDirectory = "/home/${settings.user}";

  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
