{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    ags.url = "github:aylur/ags/v2";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations.izanami = nixpkgs.lib.nixosSystem {
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
          nixpkgs.overlays = [
            rust-overlay.overlays.default
            inputs.hyprpanel.overlay
          ];
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
    homeConfigurations.dan = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {inherit system;};

      # pass inputs as specialArgs
      extraSpecialArgs = {inherit inputs;};

      # import your home.nix
      modules = [./home.nix];
    };
    # homeConfigurations.dan = home-manager.lib.homeManagerConfiguration {
    #   inherit pkgs;
    #
    #   extraSpecialArgs = {
    #   inherit inputs pkgs;
    #   };
    #   modules = [ ./home.nix ];
    # };
  };
}
