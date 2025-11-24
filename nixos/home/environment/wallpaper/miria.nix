{
  config,
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    inputs.mirai.homeManagerModules.default
  ];
  options.programs.mirai = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf config.programs.mirai.enable {
    home.packages = [pkgs.swww];
    services.swww.enable = true;
    services.mirai = {
      enable = true;
      settings = {
        local.path = "/home/dan/wallpapers/anime";
      };
    };
  };
}
