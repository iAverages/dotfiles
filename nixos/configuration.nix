{
  inputs,
  meta,
  ...
}: {
  networking.hostName = meta.hostname;

  imports = [
    inputs.home-manager.nixosModules.default
    # TOOD: Replace this
    ./packages.nix

    ./system-old/packages/default.nix
    ./system-old/user.nix
    ./system-old/firewall.nix
    ./system-old/system.nix
    ./system-old/default-apps.nix
    ./system-old/hardware/opengl.nix
    ./system-old/hardware/bluetooth.nix
    ./system-old/hardware/razer.nix
    ./system-old/gc.nix
    ./system-old/gvfs.nix
    ./system-old/plymouth.nix
    ./apps/docker.nix
    ./apps/proton.nix
    ./apps/steam.nix
    ./apps/tailscale.nix
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
