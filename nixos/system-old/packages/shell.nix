{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    uutils-coreutils-noprefix
    zsh
    starship
    fastfetch
    alacritty
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
