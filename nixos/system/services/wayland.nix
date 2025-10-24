{
  config,
  pkgs,
  lib,
  ...
}: {
  config = lib.mkIf config.environment.compositor.enable {
    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
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
  };
}
