{...}: {
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    installBatSyntax = true;
    installVimSyntax = true;
    settings = {
      font-size = 12.25;
      font-family = "JetBrainsMono Nerd Font Mono";
      background = "#181818";
      background-opacity = 0.8;
      scrollback-limit = 0;
      window-decoration = false;
    };
  };
}
