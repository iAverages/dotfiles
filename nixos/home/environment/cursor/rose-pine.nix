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
    {_args = ["XCURSOR_SIZE" "24"];}
    {_args = ["XCURSOR_THEME" "ZhuangFangyi"];}
    {_args = ["HYPRCURSOR_SIZE" "24"];}
    {_args = ["HYPRCURSOR_THEME" "ZhuangFangyi"];}
  ];
}
