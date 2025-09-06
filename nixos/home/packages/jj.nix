{pkgs, ...}: {
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
    };
  };
}
