{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixos-hardware,
    rust-overlay,
    ...
  } @ inputs: {
    nixosConfigurations.izanami = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
        meta = {hostname = "izanami";};
      };
      modules = [
        nixos-hardware.nixosModules.framework-16-7040-amd
        ./machines/izanami/hardware-configuration.nix
        ./machines/izanami/configuration.nix
        ./configuration.nix
        ({pkgs, ...}: {
          nixpkgs.overlays = [rust-overlay.overlays.default];
          environment.systemPackages = [pkgs.rust-bin.stable.latest.default];
        })
      ];
    };

    nixosConfigurations.kirsi = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
        meta = {hostname = "kirsi";};
      };
      modules = [
        ./machines/kirsi/hardware-configuration.nix
        ./machines/kirsi/configuration.nix
        ./configuration.nix
      ];
    };
  };
}
