{ lib, pkgs, ... }:

{
  services.jellyfin-mpv-shim = {
    enable = true;
    settings = {
      mpv_ext = true;
      mpv_ext_path = lib.getExe pkgs.mpv;
      mpv_ext_no_ovr = true;
    };
  };
}
