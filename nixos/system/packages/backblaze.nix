{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    backblaze-b2
  ];

  environment.shellAliases = {
    b2 = pkgs.backblaze-b2;
  };
}
