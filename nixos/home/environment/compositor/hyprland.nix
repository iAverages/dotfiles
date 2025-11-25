{
  pkgs,
  meta,
  config,
  ...
}: let
  mkMonitors = monitors: let
    formatMonitor = name: cfg: let
      res = cfg.res or "preferred";
      hertz =
        if cfg?hertz
        then "@${cfg.hertz}"
        else "";
      pos = cfg.pos or "auto";
      scale = cfg.scale or "1";
      extra =
        if cfg ? extra
        then ", ${cfg.extra}"
        else "";
    in "${name}, ${res}${hertz},${pos},${scale}${extra}";
  in
    builtins.attrValues (builtins.mapAttrs formatMonitor monitors);

  mkWorkspaces = monitors:
    monitors
    |> builtins.mapAttrs (
      monitorName: monitorCfg:
        monitorCfg.hyprland.workspaces
        |> builtins.map (ws: "${toString ws},monitor:${monitorName}")
    )
    |> builtins.attrValues
    |> builtins.concatLists;

  generateWorkspaceBinds = {
    lib,
    mainMod,
    action ? "workspace",
    offset ? 0,
  }:
    lib.range 1 10
    |> (list:
      lib.map (
        i: let
          workspaceNum = i + offset;
          key =
            if i == 10
            then "0"
            else toString i;
        in "${mainMod}, ${key}, ${action}, ${toString workspaceNum}"
      )
      list);
in {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mainMod" = "SUPER";
      # TODO: make these configurable
      "$terminal" = "${pkgs.lib.getExe pkgs.${config.environment.terminal.program}}";
      "$fileManager" = "${pkgs.lib.getExe pkgs.xfce.thunar}";
      "$menu" = "${pkgs.lib.getExe pkgs.wofi} --show drun -I -a -n -W 500 -H 376";

      exec-once = [
        "$terminal"
        "nm-applet"
        "~/.scripts/launch-waybar"
        "dunst"
      ];

      monitor = mkMonitors meta.monitors;

      workspace = mkWorkspaces meta.monitors;

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
        kb_rules = "";
        follow_mouse = 1;
        sensitivity = -0.6;

        touchpad = {
          natural_scroll = true;
        };
      };

      bind =
        [
          "$mainMod, Enter, exec, $terminal"
          "$mainMod, C, killactive,"
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
          "SUPER CTRL, h, resizeactive, -20 0"
          "SUPER CTRL, l, resizeactive, 20 0"
          "SUPER CTRL, j, resizeactive, 0 -20"
          "SUPER CTRL, k, resizeactive, 0 20"

          # Example special workspace (scratchpad)
          "$mainMod, S, togglespecialworkspace, magic"
          "$mainMod SHIFT, S, movetoworkspace, special:magic"

          # Scroll through existing workspaces with mainMod + scroll
          "$mainMod, mouse_down, workspace, e+1"
          "$mainMod, mouse_up, workspace, e-1"

          "$mainMod SHIFT, a, exec, ${pkgs.lib.getExe config.scripts.screenshot}"
          "CTRL_SHIFT, a, exec, ${pkgs.grim} -g ${pkgs.slurp} - | ${pkgs.wl-clipboard}"

          "$mainMod SHIFT, e, exec, ${pkgs.lib.getExe config.scripts.screenrecord}"
        ]
        # main monitor workspace binds
        ++ generateWorkspaceBinds {
          lib = pkgs.lib;
          mainMod = "$mainMod";
        }
        # move to workspace
        ++ generateWorkspaceBinds {
          lib = pkgs.lib;
          mainMod = "$mainMod SHIFT";
          action = "movetoworkspace";
        }
        # second monitor (normally left) binds
        ++ generateWorkspaceBinds {
          lib = pkgs.lib;
          mainMod = "$mainMod CTRL";
          offset = 10;
        }
        # third monitor (normally right) binds
        ++ generateWorkspaceBinds {
          lib = pkgs.lib;
          mainMod = "$mainMod ALT";
          offset = 20;
        };

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      windowrulev2 = "suppressevent maximize, class:.*";

      # fixes issues with nvidia
      xwayland = {force_zero_scaling = true;};

      opengl = {nvidia_anti_flicker = 0;};

      misc = {vfr = 0;};

      debug = {damage_tracking = 0;};

      ecosystem = {no_update_news = true;};
    };
  };
}
