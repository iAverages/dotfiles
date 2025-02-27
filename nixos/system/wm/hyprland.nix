{
  pkgs,
  inputs,
  ...
}: let
  hypr-pkgs-unstable = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  imports = [
    ./wayland.nix
  ];

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

    xwayland = {
      enable = true;
    };
  };

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  hardware.opengl = {
    package = hypr-pkgs-unstable.mesa.drivers;
    driSupport32Bit = true;
    package32 = hypr-pkgs-unstable.pkgsi686Linux.mesa.drivers;
  };

  # Open keyring on loging
  security = {
    pam.services.login.enableGnomeKeyring = true;
  };

  services.gnome.gnome-keyring.enable = true;

  services.xserver.excludePackages = [pkgs.xterm];

  # services.displayManager.sddm = {
  #   enable = true;
  #   wayland.enable = true;
  #   enableHidpi = true;
  #   theme = "chili";
  #   package = pkgs.sddm;
  # };
}
