{pkgs, ...}: {
  home.packages = with pkgs; [
    jq
    ripgrep
    fd
    killall
    fzf
    stow
    unzip

    # where to put these?
    networkmanager-openvpn

    # development
    bun
    nil
    pkg-config # do i even need this?

    # forget what needs this?
    inotify-tools

    # think nvim needs this?
    lua
    luarocks
  ];
}
