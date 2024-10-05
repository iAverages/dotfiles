{
  pkgs,
  settings,
  ...
}: {
  programs.zsh.enable = true;
  users.users.${settings.user} = {
    isNormalUser = true;
    description = "dan";
    shell = pkgs.zsh;
    extraGroups = ["networkmanager" "wheel"];
  };

  users.extraGroups.vboxusers.members = [settings.user];
}
