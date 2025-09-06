{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    backblaze-b2
  ];

  environment.shellAliases = {
    b2 = "b2v4";
  };
}
