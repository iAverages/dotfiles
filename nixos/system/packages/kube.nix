{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    kubectl
    lens
    k9s
    kubectx
    tilt
  ];
}
