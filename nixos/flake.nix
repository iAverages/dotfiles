{
  description = "dan nixos configuration";

  inputs = {
    mirai = {
      url = "github:iaverages/mirai";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    private.url = "git+ssh://git@github.com/iAverages/nixos-private?ref=main";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-25.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
    hyprland.url = "github:hyprwm/Hyprland";

    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ghostty = {
      url = "github:ghostty-org/ghostty";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    ...
  } @ inputs: let
    settings = {
      user = "dan";
      # TODO: set this correctly for the system being used to support
      # different types in the future (i.e if i ever get my pi on nixos)
      system = "x86_64-linux";
    };
    hosts = {
      kirsi = {
        monitors = {
          "HDMI-A-1" = {
            res = "1920x1080";
            hertz = "60";
            pos = "0x0";
            hyprland = {workspaces = [1] ++ builtins.genList (i: i + 11) 10;};
          };
          "DP-1" = {
            res = "1920x1080";
            hertz = "240";
            pos = "1920x0";
            hyprland = {workspaces = builtins.genList (i: i + 3) 8;};
          };
          "DP-2" = {
            res = "1920x1080";
            hertz = "60";
            pos = " 3840x0";
            extra = "transform,3";
            hyprland = {workspaces = [2] ++ builtins.genList (i: i + 21) 9;};
          };
        };
      };

      izanami = {
        monitors = {
          " " = {
            scale = "1.6";
            hyprland = {workspaces = builtins.genList (i: i + 1) 10;};
          };
        };
      };
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

    mkHost = hostname: attrs:
      nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs pkgs settings pkgs-stable;
          system = settings.system;
          meta = {
            inherit hostname;
            monitors = attrs.monitors;
          };
        };
        modules = [
          ./machines/${hostname}/hardware-configuration.nix
          ./machines/${hostname}/configuration.nix
          ./configuration.nix
        ];
      };
    mkHome = hostname: attrs:
      home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./user/home.nix
        ];
        extraSpecialArgs = {
          inherit settings;
          inherit pkgs;
          inherit inputs;
          meta = {
            inherit hostname;
            monitors = attrs.monitors;
          };
        };
      };
  in {
    nixosConfigurations =
      hosts
      |> nixpkgs.lib.mapAttrs (hostname: attrs: mkHost hostname attrs);

    homeConfigurations =
      builtins.attrNames hosts
      |> builtins.map (hostname: {
        name = "${settings.user}@${hostname}";
        value = hosts.${hostname};
      })
      |> builtins.listToAttrs
      |> builtins.mapAttrs (hostname: attrs: mkHome hostname attrs);
  };
}
