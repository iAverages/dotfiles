{
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

      pager = {
        args = ["${pkgs.delta}/bin/delta"];
      };
      signing = {
        behaviour = "own";
        backend = "ssh";
        key = builtins.readFile ../../machines/${meta.hostname}/${meta.hostname}_ed25519.pub;
      };
    };
  };
}
