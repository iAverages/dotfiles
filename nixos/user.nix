{pkgs, ...}: {
  users.users.dan = {
    isNormalUser = true;
    description = "dan";
    shell = pkgs.zsh;
    extraGroups = ["networkmanager" "wheel" "docker"];
    packages = with pkgs; [
    ];
  };

  users.extraGroups.vboxusers.members = ["dan"];
  users.defaultUserShell = pkgs.zsh;
}
