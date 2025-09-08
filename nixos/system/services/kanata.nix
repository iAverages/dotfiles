{
  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
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
