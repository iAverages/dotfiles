{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    deno
    jetbrains.datagrip
    jetbrains.webstorm
    python3
    go
    sleek
    nixd
    yaak
    neovim
    gh
    mariadb
    openssl
    gcc

    # nix
    alejandra

    # node
    nodePackages.pnpm
    nodejs_20

    # php (yuck)
    php
    php84Packages.composer
  ];
}
