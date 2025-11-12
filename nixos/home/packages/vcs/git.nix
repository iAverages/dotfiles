{
  lib,
  pkgs,
  meta,
  config,
  ...
}: let
  userEmail = "me@danielraybone.com";
  machinesPath = ../../../machines;
in {
  programs.git = {
    enable = true;

    userName = "iAverages";
    inherit userEmail;
    signing = {
      format = "ssh";
      key = (builtins.toString machinesPath) + "/${meta.hostname}/${meta.hostname}_ed25519.pub";
      signByDefault = true;
    };

    extraConfig = {
      gpg = {
        format = "ssh";
        ssh.allowedSignersFile = "${config.home.homeDirectory}/.config/git/allowed_signers";
      };
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
