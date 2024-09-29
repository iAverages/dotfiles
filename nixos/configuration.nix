# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{inputs, ...}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    # Include the results of the hardware scan.
    ./hardware.nix
    ./packages.nix
    ./services.nix
    ./system.nix
    ./user.nix
    ./test.nix
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      dan = import ./home.nix;
    };
  };
}
