{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.environment.bar;
in {
  programs.waybar = {
    enable = cfg.enable && cfg.program == "waybar";
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
      meson = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
    });
  };
}
