{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./backblaze.nix
    ./dev.nix
    ./kube.nix
    ./nh.nix
    ./shell.nix
    ./thunar.nix
    ./vpn.nix
  ];

  environment.systemPackages = with pkgs; [
    neovim
    inputs.ghostty.packages.x86_64-linux.default
    inputs.private.packages.x86_64-linux.default
    qview
    obsidian
  ];
}
