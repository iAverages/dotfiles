{pkgs, ...}: {
  imports = [
    ./browser
    ./games
    ./shell
    ./cli.nix
    ./cursor.nix
    ./direnv.nix
    ./fastfetch.nix
    ./git.nix
    ./gtk.nix
    ./jj.nix
    ./nh.nix
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
  ];
}
