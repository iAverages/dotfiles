{pkgs, ...}: {
  users.users.dan = {
    isNormalUser = true;
    description = "dan";
    shell = pkgs.zsh;
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
    ];
  };

  users.extraGroups.vboxusers.members = ["dan"];
  users.defaultUserShell = pkgs.zsh;
}
