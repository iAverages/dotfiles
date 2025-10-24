{
  config,
  lib,
  ...
}: {
  # options.hardware.bluetooth.enable = lib.mkEnableOption "bluetooth";

  config =
    lib.mkIf (config.environment.compositor.enable && config.hardware.bluetooth.enable) {
      services.blueman.enable = true;
    }
    // {
      hardware = {
        bluetooth = {
          powerOnBoot = true;
          settings = {General = {Experimental = "true";};};
        };
      };
    };
}
