{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./pipewire.nix
    ./dbus.nix
    ./gnome-keyring.nix
    ./fonts.nix
  ];

  # environment.systemPackages = with pkgs;
  #   [ wayland waydroid
  #     (sddm-chili-theme.override {
  #       themeConfig = {
  #         background = config.stylix.image;
  #         ScreenWidth = 1920;
  #         ScreenHeight = 1080;
  #         blur = true;
  #         recursiveBlurLoops = 3;
  #         recursiveBlurRadius = 5;
  #       };})
  #   ];

  environment.variables = {
    OZONE_PLATFORM = "wayland";
  };

  environment.systemPackages = with pkgs; [
    wl-clipboard
  ];

  # Configure xwayland
  services.xserver = {
    enable = true;
    xkb = {
      layout = "gb";
      variant = "";
    };
  };
}
