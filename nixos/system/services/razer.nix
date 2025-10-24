{
  pkgs,
  lib,
  config,
  ...
}: {
  options.environment.hardware.razer.enable = lib.mkEnableOption "razer";

  config = lib.mkIf config.environment.hardware.razer.enable {
    hardware = {
      openrazer = {
        enable = true;
        users = ["dan"];
        batteryNotifier.enable = false;
      };
    };

    environment.systemPackages = with pkgs; [
      polychromatic
    ];
  };
}
