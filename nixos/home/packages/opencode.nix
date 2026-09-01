{
  inputs,
  pkgs,
  ...
}: {
  programs.opencode = {
    enable = true;
    package = inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.opencode;
    # settings = {
    #   autoshare = false;
    #   server.port = 4096;
    # };
  };
}
