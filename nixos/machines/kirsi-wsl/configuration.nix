{
  pkgs,
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.nixos-wsl.nixosModules.default
  ];
  # environment.terminal.program = "alacritty";

  wsl.enable = true;

  networking.hostName = "kirsi-wsl";
  nixpkgs.hostPlatform = "x86_64-linux";

  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "no";

  boot.tmp.useTmpfs = true;
}
