{pkgs, ...}: {
  programs.hyprland.enable = true;
  programs.zsh.enable = true;
  programs.direnv.enable = true;
  programs.gnupg.agent.enable = true;

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
    thunderbird
    lazygit
    php
    php82Packages.composer
    termius
    yt-dlp
    ffmpeg
    docker_26
    gnumake
    jq
    ncdu

    # stuff for hyprland
    overskride
    udiskie
    hyprcursor
    hyprlock
    hyprpaper
    hypridle
  ];

  programs.nm-applet.enable = true;

  environment.variables = {
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
  };
}
