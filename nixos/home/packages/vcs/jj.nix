{
  config,
  pkgs,
  meta,
  ...
}: {
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "iAverages";
        email = "me@danielraybone.com";
      };

      ui = {
        paginate = "never";
        default-command = "log";
      };

      pager = {
        args = ["${pkgs.delta}/bin/delta"];
      };

      signing = {
        behaviour = "own";
        backend = "ssh";
        key = builtins.readFile ../../../machines/${meta.hostname}/${meta.hostname}_ed25519.pub;
        backends.ssh.allowed-signers = "${config.home.homeDirectory}/.config/git/allowed_signers";
      };

      git.sign-on-push = true;
    };
  };
}
