{
  lib,
  inputs,
  pkgs,
  ...
}: {
  home.packages = [inputs.starship-jj.packages."${pkgs.system}".starship-jj];

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = lib.concatStrings [
        "$directory"
        "\${custom.jj}"
        "$character"
      ];
      directory = {
        style = "fg:#8a38d2 bold";
        fish_style_pwd_dir_length = 1;
        truncate_to_repo = true;
      };
      character = {
        success_symbol = "[❯](fg:#6d28a5 )";
        error_symbol = "[❯](red)";
      };
      git_branch = {
        disabled = true;
        symbol = " ";
        format = "([$symbol$branch]($style)) ";
        style = "fg:#b887e4";
      };
      custom.jj = {
        command = "prompt";
        format = "$output";
        ignore_timeout = true;
        shell = ["starship-jj" "--ignore-working-copy" "starship"];
        use_stdin = false;
        when = true;
      };

      custom.git_branch = {
        when = "! jj --ignore-working-copy root";
        command = "starship module git_branch";
        description = "Only show git_branch if we're not in a jj repo";
        style = "";
      };
    };
  };
}
