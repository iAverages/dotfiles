{
  pkgs,
  inputs,
  ...
}: let
  hypr-pkgs-unstable = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  sddm-theme = inputs.silentSDDM.packages.${pkgs.system}.default.override {
    theme = "rei";
  };
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

  environment.systemPackages = [
    sddm-theme
    sddm-theme.test
  ];
  qt.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    enableHidpi = true;
    theme = sddm-theme.pname;
    package = pkgs.kdePackages.sddm;
    extraPackages = sddm-theme.propagatedBuildInputs;

    settings = {
      Wayland = {
        EnableHiDPI = true;
      };
      General = {
        GreeterEnvironment = "QML2_IMPORT_PATH=${sddm-theme}/share/sddm/themes/${sddm-theme.pname}/components/,QT_IM_MODULE=qtvirtualkeyboard";
        InputMethod = "qtvirtualkeyboard";
      };
    };
  };
}
