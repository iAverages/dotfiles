{
  lib,
  config,
  ...
}: {
  options.services.auth-usb-mount.enable = lib.mkEnableOption "auth-usb-mount";

  config = lib.mkIf config.services.auth-usb-mount.enable {
    services.devmon.enable = true;
    services.gvfs.enable = true;
    services.udisks2.enable = true;
  };
}
