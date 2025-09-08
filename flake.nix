{
  description = "dan nixos configuration";

  outputs = {
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    ...
  } @ inputs: let
    settings = {
      user = "dan";
    };
    hosts = {
      kirsi = {
        system = "x86_64-linux";
        monitors = {
          "HDMI-A-1" = {
            res = "1920x1080";
            hertz = "60";
            pos = "0x0";
            hyprland = {workspaces = [1] ++ builtins.genList (i: i + 11) 10;};
          };
          "DP-2" = {
            res = "1920x1080";
            hertz = "240";
            pos = "1920x0";
            hyprland = {workspaces = builtins.genList (i: i + 3) 8;};
          };
          "DP-1" = {
            res = "1920x1080";
            hertz = "60";
            pos = " 3840x0";
            extra = "transform,3";
            hyprland = {workspaces = [2] ++ builtins.genList (i: i + 21) 9;};
          };
        };
      };

      izanami = {
        system = "x86_64-linux";
        monitors = {
          " " = {
            scale = "1.6";
            hyprland = {workspaces = builtins.genList (i: i + 1) 10;};
          };
        };
      };
    };

    mkHost = hostname: attrs: let
      pkgs = import nixpkgs {
        system = attrs.system;
        config = {
          allowUnfree = true;
          allowUnfreePredicate = _: true;
        };
      };
      pkgs-stable = import nixpkgs-stable {
        system = attrs.system;
        config = {
          allowUnfree = true;
          allowUnfreePredicate = _: true;
        };
      };
    in
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
          ./nixos/machines/${hostname}/hardware-configuration.nix
          ./nixos/machines/${hostname}/configuration.nix
          ./nixos/system

          ./nixos/system-old/packages/default.nix
          # ./nixos/configuration.nix
        ];
      };
    mkHome = hostname: attrs: let
      pkgs = import nixpkgs {
        system = attrs.system;
        config = {
          allowUnfree = true;
          allowUnfreePredicate = _: true;
        };
      };
    in
      home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./nixos/home
          (_: {
            environment.wallpaper.enable = true;
            programs.chromium.enable = true;
            programs.firefox.enable = true;
            # config.environment.terminal.program = "ghostty";
          })
        ];
        extraSpecialArgs = {
          system = attrs.system;
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

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
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

    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
