{pkgs, ...}: {
  programs.yt-dlp.enable = true;
  home.packages = [pkgs.ffmpeg];
}
