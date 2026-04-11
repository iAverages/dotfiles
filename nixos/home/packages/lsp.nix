{pkgs, ...}: {
  home.packages = with pkgs; [
    vscode-langservers-extracted
    yaml-language-server
    bash-language-server
    lua-language-server
    statix
    ghalint
    stylua
  ];
}
