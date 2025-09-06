{lib, ...}: {
  imports = [./waybar.nix];

  options.environment.bar = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    program = lib.mkOption {
      type = lib.types.enum [
        "waybar"
      ];
      default = "waybar";
    };
  };
}
