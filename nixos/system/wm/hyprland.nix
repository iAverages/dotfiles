{pkgs, ...}: {
  imports = [
    ./wayland.nix
  ];

  # Open keyring on loging
  security = {
    pam.services.login.enableGnomeKeyring = true;
  };

  services.gnome.gnome-keyring.enable = true;

  programs = {
    hyprland = {
      enable = true;
      xwayland = {
        enable = true;
      };
    };
  };

  services.xserver.excludePackages = [pkgs.xterm];

  services.xserver = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      enableHidpi = true;
      theme = "chili";
      package = pkgs.sddm;
    };
  };
}
