# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{inputs, ...}: {
  imports = [
    inputs.home-manager.nixosModules.default
    # Include the results of the hardware scan.
    ./hardware.nix
    ./packages.nix
    ./services.nix
    ./system.nix
    ./user.nix
    ./test.nix
  ];

  # homeConfigurations."dan" = inputs.home-manager.lib.homeManagerConfiguration {
  #   pkgs = pkgs;
  #   # pass inputs as specialArgs
  #   extraSpecialArgs = {inherit inputs;};
  #
  #   # import your home.nix
  #   modules = [./home.nix];
  # };

  # home-manager = {
  #   extraSpecialArgs = {inherit inputs;};
  #   users = {
  #     dan = import ./home.nix;
  #   };
  # };
}
