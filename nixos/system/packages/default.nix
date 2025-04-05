{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./backblaze.nix
    ./nh.nix
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
    tailscale
    k9s
    kubectx
    obsidian
    nixd
    yaak
  ];
}
