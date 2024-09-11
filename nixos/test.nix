{pkgs, ...}: {
  environment.variables = {
    NIXOS_OZONE_WL = 1;
  };

  environment.systemPackages = with pkgs; [
    swww
    grim # screenshot functionality
    gtk3
    hyprpaper
    hyprpicker
    mako # notification system developed by swaywm maintainer
    mm-common
    nil
    nwg-look
    pika-backup
    pkg-config
    pop-gtk-theme
    qemu
    ripgrep
    sassc
    slurp # screenshot functionality
    stow
    transmission_4-gtk
    unzip
    wl-clipboard
    wofi
    zenity
    gnome.networkmanager-openvpn
    gnome.gnome-shell-extensions
    gnomeExtensions.tiling-assistant
    gnomeExtensions.window-calls
    grim
  ];

  programs.hyprland.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
}
