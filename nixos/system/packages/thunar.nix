{pkgs, ...}: {
  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [thunar-archive-plugin thunar-volman];
  services.gvfs.enable = true;
  services.tumbler.enable = true;
}
