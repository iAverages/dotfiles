{settings, ...}: {
  programs.zsh = {
    enable = true;
    sessionVariables = {
      NH_FLAKE = "/home/${settings.user}/dotfiles";
    };
  };
}
