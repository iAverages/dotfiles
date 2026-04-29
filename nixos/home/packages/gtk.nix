{
  pkgs,
  config,
  ...
}: {
  gtk = {
    enable = true;
    cursorTheme = {
      name = "ZhuangFangyi";
      # package = pkgs.rose-pine-cursor;
      size = 24;
    };

    gtk4.theme = config.gtk.theme;

    iconTheme = {
      name = "breeze-dark";
      package = pkgs.kdePackages.breeze-icons;
    };

    theme = {
      name = "rose-pine";
      # package = pkgs.rose-pine-gtk-theme;
    };
  };
}
