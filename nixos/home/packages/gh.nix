{pkgs, ...}: {
  programs.gh = {
    enable = true;
    settings = {
      version = 1;
      git_protocol = "ssh";
      editor = "${pkgs.lib.getExe pkgs.neovim}";
      prompt = "enabled";
      pager = "${pkgs.lib.getExe pkgs.delta}";
      aliases = {
        co = "pr checkout";
        opr = "pr view --web";
      };
      http_unix_socket = "";
      browser = "";
    };
    hosts = {
      github_com = {
        git_protocol = "ssh";
        users = {
          iAverages = {};
        };
        user = "iAverages";
      };
    };
  };
}
