{lib, ...}: {
  imports = [./noctalia.nix];

  options.environment.desktop-shell = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    program = lib.mkOption {
      type = lib.types.enum [
        "noctalia"
      ];
      default = "noctalia";
    };
  };
}
