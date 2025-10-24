{inputs, ...}: {
  imports = [
    inputs.nixos-wsl.nixosModules.default
  ];

  wsl.enable = true;
  wsl.defaultUser = "dan";

  networking.hostName = "kirsi-wsl";
  nixpkgs.hostPlatform = "x86_64-linux";

  boot.tmp.useTmpfs = true;
}
