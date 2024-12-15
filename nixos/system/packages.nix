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
    deno
    qview
    dive
    cosmic-files
  ];

  nixpkgs.config.allowUnfree = true;
}
