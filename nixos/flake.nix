{
  description = "dan nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
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
  in {
    nixosConfigurations.izanami = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs pkgs settings;
        system = settings.system;
        meta = {hostname = "izanami";};
      };
      modules = [
        ./machines/izanami/hardware-configuration.nix
        ./machines/izanami/configuration.nix
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
