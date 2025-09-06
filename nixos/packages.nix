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
    git
    google-chrome
    discord
    spotify
    libreoffice
    yarn
    waybar
    (waybar.overrideAttrs (oldAttrs: {
      meson = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
    }))
    dunst
    rofi-wayland
    networkmanagerapplet
    thunderbird
    lazygit
    # termius
    yt-dlp
    ffmpeg
    gnumake
    jq
    ncdu
    # unzip
    ripgrep
    luarocks
    fd
    lua
    lua5_1
    prettierd
    playerctl
    inotify-tools
    killall
    fzf
    obs-studio
    rose-pine-cursor
    inputs.rose-pine-hyprcursor.packages.${system}.default
    bun
    steam
    home-manager
    webkitgtk_4_1
    swaynotificationcenter
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
    nautilus
    networkmanager-openvpn
    gnome-shell-extensions
    gnomeExtensions.tiling-assistant
    gnomeExtensions.window-calls
    grim
    blueman
    prismlauncher
    vesktop
    helvum
    kanata
    wf-recorder
    wob
    quickshell
    jujutsu
  ];

  environment.variables = {
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
  };

  qt.enable = true;
}
