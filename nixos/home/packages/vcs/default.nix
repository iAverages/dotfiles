{lib, ...}: let
  userEmail = "me@danielraybone.com";
  allowedSignersFilePath = ".config/git/allowed_signers";
  machinesPath = ../../../machines;
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
  imports = [./git.nix ./jj.nix];

  home.file.${allowedSignersFilePath}.text = allowedSigners;
}
