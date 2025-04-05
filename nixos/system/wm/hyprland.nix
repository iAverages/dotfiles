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

  hardware.graphics = {
    package = hypr-pkgs-unstable.mesa;
    enable32Bit = true;
    package32 = hypr-pkgs-unstable.pkgsi686Linux.mesa;
  };

  # Open keyring on loging
  security = {
    pam.services.login.enableGnomeKeyring = true;
  };

  services.gnome.gnome-keyring.enable = true;

  services.xserver.excludePackages = [pkgs.xterm];

  environment.systemPackages = with pkgs; [
    (
      sddm-chili-theme.override {
        themeConfig = {
          # background = "/home/dan/dotfiles/wallpapers/raana-01.png";
          # ScreenWidth = 1920;
          # ScreenHeight = 1080;
          # blur = true;
          # recursiveBlurLoops = 3;
          # recursiveBlurRadius = 5;
        };
      }
    )
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    enableHidpi = true;
    theme = "chili";
    package = pkgs.libsForQt5.sddm;
  };
}
