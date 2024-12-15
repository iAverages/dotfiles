{...}: {
  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        # extraDefCfg = "process-unmapped-keys yes";
        config = ''
          (defsrc
            caps
          )

          (defalias
            capsesc esc
          )

          (deflayer base
            @capsesc
          )
        '';
      };
    };
  };
}
