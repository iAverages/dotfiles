{
  description = "dan nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-24.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
    ags.url = "github:aylur/ags";
    xremap-flake.url = "github:xremap/nix-flake";
    hyprland.url = "github:hyprwm/Hyprland";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ghostty = {
      url = "github:ghostty-org/ghostty";

      # NOTE: The below 2 lines are only required on nixos-unstable,
      # if you're on stable, they may break your build
      inputs.nixpkgs-stable.follows = "nixpkgs";
      inputs.nixpkgs-unstable.follows = "nixpkgs";
    };

    # private = {
    #   url = "git+ssh://git@github.com/iAverages/nixos-private?ref=main";
    # };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    nixos-hardware,
    rust-overlay,
    home-manager,
    ...
  } @ inputs: let
    settings = {
      user = "dan";
      system = "x86_64-linux";
    };
    pkgs = import nixpkgs {
      system = settings.system;
      config = {
        allowUnfree = true;
        allowUnfreePredicate = _: true;
      };
    };
    pkgs-stable = import nixpkgs-stable {
      system = settings.system;
      config = {
        allowUnfree = true;
        allowUnfreePredicate = _: true;
      };
    };
  in {
    nixosConfigurations.izanami = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs pkgs settings pkgs-stable;
        system = settings.system;
        meta = {hostname = "izanami";};
      };
      modules = [
        ./machines/izanami/hardware-configuration.nix
        ./machines/izanami/configuration.nix
        ./configuration.nix
      ];
    };

    nixosConfigurations.kirsi = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs pkgs settings;
        system = settings.system;
        meta = {hostname = "kirsi";};
      };
      modules = [
        ./machines/kirsi/hardware-configuration.nix
        ./machines/kirsi/configuration.nix
        ./configuration.nix
      ];
    };

    homeConfigurations = {
      ${settings.user} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./user/home.nix
        ];
        extraSpecialArgs = {
          inherit settings;
          inherit pkgs;
          inherit inputs;
        };
      };
    };
  };
}
