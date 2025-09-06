{
  pkgs,
  system,
  ...
}: {
  home.packages = with pkgs; [
    rose-pine-cursor
    inputs.rose-pine-hyprcursor.packages.${system}.default
  ];

  wayland.windowManager.hyprland.settings.env = [
    "XCURSOR_SIZE,24"
    "XCURSOR_THEME,BreezeX-RosePine-Linux"
    "HYPRCURSOR_SIZE,24"
    "HYPRCURSOR_THEME,rose-pine-hyprcursor"
  ];
}
