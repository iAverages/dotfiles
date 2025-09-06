{pkgs, ...}: {
  imports = [
    ./browser
    ./shell
    ./cli.nix
    ./cursor.nix
    ./fastfetch.nix
    ./git.nix
    ./gtk.nix
    ./vesktop.nix
  ];

  home.packages = with pkgs; [
    spotify
    libreoffice
    obs-studio
    blueman
  ];
}
