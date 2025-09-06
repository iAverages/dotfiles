{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.programs.chromium;
in {
  config = lib.mkIf cfg.enable {
    programs.chromium = {
      package = pkgs.google-chrome;
    };
  };
}
