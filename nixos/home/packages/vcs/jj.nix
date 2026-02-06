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

      aliases = let
        # move x branch to newest change that isnt empty
        move-branch = ["bookmark" "set" "--revision" "(@ ~ empty()) | parents(@ & empty())"];
      in {
        # removes all "orphaned side branches", helps when branches are squashed on github from a PR
        # this will remove all changes not inline with main or not tracked by a bookmark
        cleanup = ["abandon" "-r" "mutable() ~ ::main ~ main:: ~ ::bookmarks()"];

        inherit move-branch;
        mb = move-branch;
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
