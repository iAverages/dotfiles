{pkgs, ...}: {
  hardware.openrazer.enable = true;

  hardware.openrazer.users = ["dan"];
  environment.systemPackages = with pkgs; [
    polychromatic
  ];
}
