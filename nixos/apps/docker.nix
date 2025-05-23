{
  pkgs,
  settings,
  ...
}: {
  virtualisation.docker = {
    enable = true;
    package = pkgs.docker_27;
    enableOnBoot = true;
    autoPrune.enable = true;
    liveRestore = false;
  };
  virtualisation.docker.extraOptions = "--insecure-registry=\"ctr.dan.local\"";
  users.users.${settings.user}.extraGroups = ["docker"];
  environment.systemPackages = with pkgs; [
    docker
    dive
  ];
}
