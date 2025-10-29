{
  pkgs,
  meta,
  ...
}: {
  programs.git = {
    enable = true;

    userName = "iAverages";
    userEmail = "me@danielraybone.com";
    signing = {
      format = "ssh";
      key = builtins.readFile ../../machines/${meta.hostname}/${meta.hostname}_ed25519.pub;
      signByDefault = true;
    };

    extraConfig = {
      init.defaultBranch = "main";
      core.pager = "${pkgs.delta}/bin/delta";
      interactive.diffFilter = "${pkgs.delta}/bin/delta --color-only";
      delta = {
        navigate = true;
      };
      merge.conflictstyle = "zdiff3";
      push = {
        autoSetupRemote = true;
      };
      url."ssh://git@github.com/" = {
        insteadOf = "https://github.com/";
      };
    };
  };
}
