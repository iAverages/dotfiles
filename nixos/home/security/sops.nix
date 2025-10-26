{
  meta,
  settings,
  inputs,
  ...
}: {
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];
  sops = {
    defaultSopsFile = ../../secrets.yaml;
    age = {
      sshKeyPaths = ["/home/${settings.user}/.ssh/${meta.hostname}_ed25519"];
      keyFile = "/home/${settings.user}/.config/sops/age/keys.txt";
    };

    secrets = {
      avrgApiToken = {};
    };
  };
}
