{config, ...}: let
  cfg = config.environment.terminal;
in {
  programs.alacritty = {
    enable = cfg.enable && cfg.program == "alacritty";
    settings = {
      env = {
        TERM = "xterm-256color";
      };
      window = {
        decorations = "full";
        opacity = 0.8;
      };
      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
      };
      scrolling = {
        history = 0;
      };
      general = {
        live_config_reload = true;
      };
    };
  };
}
