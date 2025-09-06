{pkgs, ...}: {
  home.packages = with pkgs; [quickshell];
  qt.enable = true;
}
