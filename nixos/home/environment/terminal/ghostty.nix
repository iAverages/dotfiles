{
  config,
  platform,
  pkgs,
  ...
}: let
  cfg = config.environment.terminal;
in {
  programs.ghostty = {
    enable = cfg.enable && cfg.program == "ghostty";
    enableZshIntegration = true;
    installBatSyntax = true;
    installVimSyntax = true;
    settings = {
      font-size = 11.25;
      font-family = "JetBrainsMono Nerd Font";
      adjust-cell-height = 1;
      background = "#181818";
      background-opacity = 0.8;
      scrollback-limit = 0;
      window-decoration = false;
      mouse-scroll-multiplier = 0.5;

      keybind = ["ctrl+shift+left=unbind" "ctrl+shift+right=unbind"];
    };
  };
}
