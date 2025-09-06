{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      inter
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
    ];

    fontconfig.defaultFonts = {
      serif = ["Noto Serif" "Noto Serif CJK SC"];
      sansSerif = ["Inter" "Noto Sans" "Noto Sans CJK SC"];
      monospace = ["JetBrainsMono Nerd Font" "Noto Sans Mono"];
      emoji = ["Noto Color Emoji"];
    };
  };
}
