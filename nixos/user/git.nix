{
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
    };
  };
}
