{
  pkgs,
  settings,
  ...
}: {
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    autoPrune.enable = true;
  };
  users.users.${settings.user}.extraGroups = ["docker"];
  environment.systemPackages = with pkgs; [
    docker
  ];
}
