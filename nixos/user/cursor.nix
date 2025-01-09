{pkgs, ...}: {
  home.packages = with pkgs; [
    rose-pine-cursor
  ];

  home.sessionVariables = {
    XCURSOR_THEME = "rose-pine";
    XCURSOR_SIZE = "24";
  };

  home.file.".config/gtk-3.0/settings.ini".text = ''
    [Settings]
    gtk-cursor-theme-name = rose-pine
    gtk-cursor-theme-size = 24
  '';

  home.file.".config/gtk-4.0/settings.ini".text = ''
    [Settings]
    gtk-cursor-theme-name = rose-pine
    gtk-cursor-theme-size = 24
  '';
}
