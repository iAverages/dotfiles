{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    zsh
    starship
    neovim
    kubectl
    inputs.ghostty.packages.x86_64-linux.default
    lens
    xclip
  ];

  nixpkgs.config.allowUnfree = true;
}
