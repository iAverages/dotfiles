{pkgs, ...}: {
  imports = [
    ./ags.nix
  ];

  home.packages = with pkgs; [
    swaynotificationcenter
    swww
    grim
    hyprpicker
    dunst
    nil
    slurp
    wofi
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mainMod" = "SUPER";
      "$terminal" = "ghostty";
      "$fileManager" = "thunar";
      "$menu" = "wofi --show drun -I -a -n -W 500 -H 376";

      exec-once = ["$terminal" "~/dotfiles/.config/hypr/start.sh"];

      # desktop monitors
      monitor = [
        "HDMI-A-1, 1920x1080@60,0x0,1" # left
        "DP-1,     1920x1080@240,1920x0,1" # middle
        "DP-2,     1920x1080@60, 3840x0, 1, transform,3" # right

        ",preferred,auto,auto" # default if new monitor / device
      ];

      workspace = [
        "1,monitor:HDMI-A-1"

        "2,monitor:DP-2"

        "3,monitor:DP-1"
        "4,monitor:DP-1"
        "5,monitor:DP-1"
        "6,monitor:DP-1"
        "7,monitor:DP-1"
        "9,monitor:DP-1"
        "8,monitor:DP-1"
        "10,monitor:DP-1"
        "11,monitor:DP-1"
        "12,monitor:DP-1"
        "13,monitor:DP-1"
      ];

      env = [
        "XCURSOR_SIZE,24"
        "XCURSOR_THEME,BreezeX-RosePine-Linux"
        "HYPRCURSOR_SIZE,24"
        "HYPRCURSOR_THEME,rose-pine-hyprcursor"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgb(7e22ce) rgb(3f1167) 45deg";
        "col.inactive_border" = "0xff382D2E";
        no_border_on_floating = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;

        active_opacity = 1.0;
        inactive_opacity = 1.0;

        blur = {
          enabled = true;
          size = 1;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {new_status = "master";};

      misc = {disable_hyprland_logo = true;};
      input = {
        kb_layout = "gb";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";
        follow_mouse = 1;
        sensitivity = -0.6;

        touchpad = {
          natural_scroll = true;
        };
      };

      gestures = {workspace_swipe = false;};

      bind = [
        "$mainMod, Enter, exec, $terminal"
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, $menu"
        "$mainMod, P, pseudo,"
        "$mainMod, J, togglesplit,"

        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, j, movefocus, u"
        "$mainMod, k, movefocus, d"

        # resize
        "SUPER CTRL, left, resizeactive, -20 0"
        "SUPER CTRL, right, resizeactive, 20 0"
        "SUPER CTRL, up, resizeactive, 0 -20"
        "SUPER CTRL, down, resizeactive, 0 20"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Example special workspace (scratchpad)
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        "$mainMod SHIFT, a, exec, ~/dotfiles/.scripts/screenshot"
        "CTRL_SHIFT, a, exec, grim -g ${pkgs.slurp} - | wl-copy"

        "$mainMod SHIFT, e, exec, ~/dotfiles/.scripts/screenrecord"
      ];

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      windowrulev2 = "suppressevent maximize, class:.*";

      # fixes issues with nvidia
      xwayland = {force_zero_scaling = true;};

      render = {
        explicit_sync = 2;
        explicit_sync_kms = 0;
      };

      opengl = {nvidia_anti_flicker = 0;};

      misc = {vfr = 0;};

      debug = {damage_tracking = 0;};
    };
  };
}
