{
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
}
