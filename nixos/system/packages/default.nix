{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./backblaze.nix
  ];

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
    python3
    go
    sleek
  ];

  nixpkgs.config.allowUnfree = true;
}
