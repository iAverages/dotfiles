{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.environment.compositor.enable {
    services.kanata = {
      enable = true;
      keyboards = {
        internalKeyboard = {
          config = ''
            (defsrc
              esc
              caps
            )

            (deflayer base
              grave
              esc
            )
          '';
        };
      };
    };
  };
}
