{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    zsh
    starship
    nvim
  ];
}
