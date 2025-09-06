{
  lib,
  config,
  ...
}: {
  imports = [./miria.nix];
  options.environment.wallpaper = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf config.environment.wallpaper.enable {
    programs.mirai.enable = true;
  };
}
