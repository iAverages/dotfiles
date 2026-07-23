{pkgs, ...}: {
  imports = [
    ./browser
    ./games
    ./rofi
    ./shell
    ./vcs
    ./atuin.nix
    ./cli.nix
    ./cursor.nix
    ./direnv.nix
    ./fastfetch.nix
    ./gh.nix
    ./gtk.nix
    ./lsp.nix
    ./nh.nix
    ./opencode.nix
    ./proton.nix
    ./vesktop.nix
    ./yt-dlp.nix
  ];

  home.packages = with pkgs; [
    spotify
    bun
    libreoffice
    obs-studio
    blueman
    bruno
    gparted
    graphite-cli
    attic-client
    lens
    # (pkgs.callPackage ./hytale.nix {})
  ];
}
