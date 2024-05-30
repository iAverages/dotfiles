{}: {
  programs.hyprland.enable = true;
  programs.zsh.enable = true;
  programs.direnv.enable = true;

  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vscode
    neovim
    git
    fastfetch
    zsh
    stow
    starship
    alacritty
    google-chrome
    htop
    btop
    bat
    wget
    tmux
    discord
    spotify
    gh
    mysql
    libreoffice
    #rustc
    #cargo
    #clippy
    yarn
    nodePackages.pnpm
    nodejs_20
    openssl
    gcc
    tilt
    distrobox
    alejandra
    tig
    libnotify
    smplayer
    mpv
    rustup
    wofi
    teams-for-linux
    stripe-cli
    waybar
    (waybar.overrideAttrs (oldAttrs: {
      meson = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
    }))
    dunst
    libnotify
    swww
    rofi-wayland
    networkmanagerapplet
  ];
}
