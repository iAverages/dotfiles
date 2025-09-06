{pkgs, ...}: {
  home.packages = with pkgs; [
    rose-pine-cursor
  ];

  home.sessionVariables = {
    XCURSOR_THEME = "BreezeX-RosePine-Linux";
    XCURSOR_SIZE = "24";
  };
}
