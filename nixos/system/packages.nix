{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    zsh
    starship
    neovim
    kubectl
  ];
}
