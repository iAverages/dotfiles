{pkgs, ...}: {
  imports = [
    ./docker.nix
    ./hyprland.nix
    ./nix-ld.nix
    ./thunar.nix
    ./waydroid.nix
  ];

  environment.systemPackages = with pkgs; [
    via
    vial
  ];

  services.udev.packages = [pkgs.via];
}
