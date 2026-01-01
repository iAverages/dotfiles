{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.aagl.nixosModules.default
    ./steam.nix
  ];

  nix.settings = inputs.aagl.nixConfig;
  programs.anime-game-launcher.enable = true;

  environment.systemPackages = with pkgs; [
    wine
    (lutris.override {
      extraLibraries = pkgs: [
        gtk4
        libadwaita
      ];
    })
  ];
}
