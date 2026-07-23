{...}: {
  # files for this cursor are private
  wayland.windowManager.hyprland.settings.env = [
    {_args = ["XCURSOR_SIZE" "24"];}
    {_args = ["XCURSOR_THEME" "ZhuangFangyi"];}
    {_args = ["HYPRCURSOR_SIZE" "24"];}
    {_args = ["HYPRCURSOR_THEME" "ZhuangFangyi"];}
  ];
}
