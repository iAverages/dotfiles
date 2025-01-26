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
    jetbrains.webstorm
    python3
    go
    sleek
    wireguard-tools
  ];

  nixpkgs.config.allowUnfree = true;
}
