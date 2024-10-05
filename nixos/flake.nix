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

    abby = pkgs.stdenv.mkDerivation {
      pname = "abby";
      version = "0.5.4";

      src = /home/dan/Downloads/abby/bundle/deb/abby.deb;

      nativeBuildInputs = [pkgs.dpkg];
      buildInputs = [pkgs.webkitgtk]; # Add webkitgtk to the build inputs

      dontUnpack = true;
      installPhase = ''
        mkdir -p $out
        dpkg -x $src $out
        cp -av $out/usr/* $out
        rm -rf $out/opt $out/usr
        # rm $out/bin/Abbys_Little_Theft
        #
        # ln -s "$out/share/skypeforlinux/skypeforlinux" "$out/bin/skypeforlinux"

        # Otherwise it looks "suspicious"
        chmod -R g-w $out
      '';

      postFixup = ''
        # for file in $(find $out -type f \( -perm /0111 -o -name \*.so\* -or -name \*.node\* \) ); do
        #   patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" "$file" || true
        #   patchelf --set-rpath $ {rpath}:$out/share/Abbys\ Little\ Theft.desktop $file || true
        # done
        patchelf --set-rpath $(nix eval --raw nixpkgs.webkitgtk.out)/lib $out/bin/Abbys_Little_Theft
        patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" "$out/bin/Abbys_Little_Theft"

        # Fix the desktop link
        substituteInPlace $out/share/applications/Abbys\ Little\ Theft.desktop \
          --replace /usr/bin/ $out/bin/
      '';
    };
    # abby = pkgs.callPackage ./abby.nix {};
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
        # ./abby.nix
        ({...}: {
          environment.systemPackages = [abby];
        })
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
