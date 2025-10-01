{
  pkgs,
  inputs,
  ...
}: {
  # TODO: sort these out
  home.packages = with pkgs; [
    jq
    ripgrep
    fd
    killall
    fzf
    stow
    unzip
    playerctl

    starship

    # where to put these?
    networkmanager-openvpn
    networkmanagerapplet

    # development
    bun
    nil
    pkg-config # do i even need this?

    # forget what needs this?
    inotify-tools

    # think nvim needs this?
    lua
    luarocks

    neovim
    # inputs.ghostty.packages.x86_64-linux.default
    inputs.private.packages.x86_64-linux.default
    qview
    obsidian
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

    # make "kube" module with option to enable these
    kubectl
    lens
    k9s
    kubectx
    tilt

    uutils-coreutils-noprefix
    zsh
    starship
    fastfetch
    stow
    kitty # for fastfetch image preview
    btop
    bat
    tmux
    wget
    tig
    libnotify
    mpv
    stripe-cli
    eza
    du-dust
    hyperfine
    cargo-info
    delta
    tokei
  ];
}
