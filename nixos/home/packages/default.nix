{
  pkgs,
  inputs,
  ...
}: {
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
    ./herdr.nix
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
    inputs.visual-diff.packages.x86_64-linux.default
    feishin
    anki
    inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.chatgpt
    # (pkgs.callPackage ./hytale.nix {})
  ];
}
