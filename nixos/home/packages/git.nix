{
  lib,
  pkgs,
  meta,
  config,
  ...
}: let
  userEmail = "me@danielraybone.com";
  allowedSignersFilePath = ".config/git/allowed_signers";
  machinesPath = ../../machines;
  allowedSigners =
    builtins.readDir machinesPath
    |> lib.filterAttrs (name: type: type == "directory")
    |> lib.attrNames
    |> map (hostname: let
      keyPath = machinesPath + "/${hostname}/${hostname}_ed25519.pub";
    in
      if builtins.pathExists keyPath
      then "${userEmail} ${lib.removeSuffix "\n" (builtins.readFile keyPath)}"
      else null)
    |> lib.filter (x: x != null)
    |> lib.concatStringsSep "\n";
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
        ssh.allowedSignersFile = "${config.home.homeDirectory}/${allowedSignersFilePath}";
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

  home.file.${allowedSignersFilePath}.text = allowedSigners;
}
