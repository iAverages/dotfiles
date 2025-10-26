{
  config,
  settings,
  inputs,
  ...
}: {
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];
  sops = {
    defaultSopsFile = ../../secrets.yaml;
    age = {
      sshKeyPaths = ["/home/${settings.user}/.ssh/${config.networking.hostName}_ed25519"];
      keyFile = "/home/${settings.user}/.config/sops/age/keys.txt";
    };
    secrets = {
      danPassword = {
        neededForUsers = true;
      };
    };
  };
}
