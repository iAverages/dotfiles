{pkgs, ...}: {
  hardware = {
    openrazer = {
      enable = true;
      users = ["dan"];
      batteryNotifier.enable = false;
    };
  };

  environment.systemPackages = with pkgs; [
    polychromatic
  ];
}
