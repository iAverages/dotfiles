{
  inputs,
  meta,
  ...
}: {
  networking.hostName = meta.hostname;

  imports = [
    inputs.home-manager.nixosModules.default
    ./packages.nix

    # ./system/private.nix
    # ./system/kanata.nix
    ./system/user.nix
    ./system/firewall.nix
    ./system/system.nix
    ./system/hardware/opengl.nix
    ./system/hardware/bluetooth.nix
    ./system/hardware/razer.nix
    ./apps/docker.nix
    ./apps/steam.nix
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
