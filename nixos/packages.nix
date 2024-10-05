{
  pkgs,
  inputs,
  ...
}: {
  programs.hyprland.enable = true;
  programs.zsh.enable = true;
  programs.direnv.enable = true;
  programs.gnupg.agent.enable = true;

  lib = with pkgs; [
    webkitgtk
  ];

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
    alejandra
    tig
    libnotify
    mpv
    stripe-cli
    waybar
    (waybar.overrideAttrs (oldAttrs: {
      meson = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
    }))
    dunst
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
    gnumake
    jq
    ncdu
    unzip
    ripgrep
    luarocks
    fd
    lua
    prettierd
    playerctl
    inotify-tools
    killall
    fzf
    obs-studio
    inputs.rose-pine-hyprcursor.packages.${system}.default
    bun
    steam
    home-manager
    webkitgtk_4_1
    swaynotificationcenter
    swww
    grim # screenshot functionality
    gtk3
    hyprpaper
    hyprpicker
    dunst
    mm-common
    nil
    nwg-look
    pika-backup
    pkg-config
    pop-gtk-theme
    qemu
    ripgrep
    sassc
    slurp # screenshot functionality
    stow
    transmission_4-gtk
    unzip
    wl-clipboard
    wofi
    zenity
    gnome.networkmanager-openvpn
    gnome.gnome-shell-extensions
    gnomeExtensions.tiling-assistant
    gnomeExtensions.window-calls
    grim
    blueman
  ];

  environment.variables = {
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
  };
}
