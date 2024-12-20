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
    inputs.private.packages.x86_64-linux.default
    lens
    deno
    qview
    dive
    cosmic-files
    jetbrains.datagrip
  ];

  nixpkgs.config.allowUnfree = true;
}
