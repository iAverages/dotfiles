{
  pkgs,
  settings,
  config,
  ...
}: {
  programs.zsh.enable = true;
  users.users.${settings.user} = {
    isNormalUser = true;
    description = "dan";
    shell = pkgs.zsh;
    extraGroups = ["networkmanager" "wheel"];
    hashedPasswordFile = config.sops.secrets.danPassword.path;
  };

  users.extraGroups.vboxusers.members = [settings.user];
}
