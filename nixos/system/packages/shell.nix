{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
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
  ];
}
