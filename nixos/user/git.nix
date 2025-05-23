{pkgs, ...}: {
  programs.git = {
    enable = true;

    userName = "iAverages";
    userEmail = "me@danielraybone.com";
    signing = {
      key = "53300CDDBF4B6CF4";
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
    };
  };
}
