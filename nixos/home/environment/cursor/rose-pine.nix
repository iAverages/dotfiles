{
  inputs,
  pkgs,
  ...
}: {
  # home.packages = with pkgs; [
  #   rose-pine-cursor
  #   inputs.rose-pine-hyprcursor.packages.${pkgs.stdenv.hostPlatform.system}.default
  # ];

  wayland.windowManager.hyprland.settings.env = [
    "XCURSOR_SIZE,24"
    "XCURSOR_THEME,ZhuangFangyi"
    "HYPRCURSOR_SIZE,24"
    "HYPRCURSOR_THEME,ZhuangFangyi"
  ];
}
