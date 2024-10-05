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
  };
  users.users.${settings.user}.extraGroups = ["docker"];
  environment.systemPackages = with pkgs; [
    docker
  ];
}
