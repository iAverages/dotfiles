{pkgs, ...}: {
  imports = [
    ./browser
    ./games
    ./shell
    ./vcs
    ./atuin.nix
    ./cli.nix
    ./cursor.nix
    ./direnv.nix
    ./fastfetch.nix
    ./gh.nix
    ./gtk.nix
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
