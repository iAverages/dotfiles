{pkgs, ...}: {
  imports = [
    ./ags.nix
  ];

  home.packages = with pkgs; [
    swaynotificationcenter
    swww
    grim
    hyprpicker
    dunst
    nil
    slurp
    wofi
  ];
}
