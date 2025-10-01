{lib, ...}: {
  imports = [
    ./ghostty.nix
    ./alacritty.nix
  ];

  options.environment.terminal = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    program = lib.mkOption {
      type = lib.types.enum [
        "ghostty"
        "alacritty"
      ];
      default = "ghostty";
    };
  };
}
