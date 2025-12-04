{
  inputs,
  config,
  lib,
  ...
}: let
  cfg = config.environment.bar;
in {
  imports = [
    inputs.noctalia.homeModules.default
  ];

  config = lib.mkIf cfg.enable {
    programs.noctalia-shell = {
      systemd.enable = true;
      enable = true;
      colors = {
        "mPrimary" = "#b58fff";
        "mOnPrimary" = "#000000";
        "mSecondary" = "#c79aff";
        "mOnSecondary" = "#000000";
        "mTertiary" = "#d8b4ff";
        "mOnTertiary" = "#000000";
        "mError" = "#ff6f9b";
        "mOnError" = "#000000";
        "mSurface" = "#000000";
        "mOnSurface" = "#e8d8ff";
        "mSurfaceVariant" = "#110d1a";
        "mOnSurfaceVariant" = "#b58fff";
        "mOutline" = "#4c3a70";
        "mShadow" = "#000000";
      };
      # settings = {
      #   settingsVersion = 26;
      #   bar = {
      #     position = "top";
      #     backgroundOpacity = 1;
      #     monitors = [];
      #     density = "default";
      #     showCapsule = true;
      #     capsuleOpacity = 1;
      #     floating = true;
      #     marginVertical = 0.25;
      #     marginHorizontal = 0.25;
      #     outerCorners = true;
      #     exclusive = true;
      #     widgets = {
      #       left = [
      #         {
      #           icon = "rocket";
      #           id = "CustomButton";
      #           leftClickExec = "qs -c noctalia-shell ipc call launcher toggle";
      #         }
      #         # {
      #         #   id = "SystemMonitor";
      #         # }
      #         {
      #           id = "Workspace";
      #         }
      #       ];
      #       center = [
      #         {
      #           id = "MediaMini";
      #         }
      #       ];
      #       right = [
      #         # TODO: can i use my script instead?
      #         # {
      #         #   id = "ScreenRecorder";
      #         # }
      #         {
      #           id = "Tray";
      #         }
      #         {
      #           id = "NotificationHistory";
      #         }
      #         # TODO: make these configable for laptop
      #         # {
      #         #   id = "Battery";
      #         # }
      #         # {
      #         #   id = "Brightness";
      #         # }
      #         {
      #           id = "Volume";
      #         }
      #         {
      #           id = "ControlCenter";
      #         }
      #         {
      #           id = "Clock";
      #           usePrimaryColor = false;
      #         }
      #       ];
      #     };
      #   };
      #   general = {
      #     avatarImage = "/home/dan/.face";
      #     dimmerOpacity = 0.6;
      #     showScreenCorners = false;
      #     forceBlackScreenCorners = false;
      #     scaleRatio = 1;
      #     radiusRatio = 1;
      #     iRadiusRatio = 1;
      #     boxRadiusRatio = 1;
      #     screenRadiusRatio = 1;
      #     animationSpeed = 1;
      #     animationDisabled = false;
      #     compactLockScreen = false;
      #     lockOnSuspend = true;
      #     showHibernateOnLockScreen = false;
      #     enableShadows = true;
      #     shadowDirection = "bottom_right";
      #     shadowOffsetX = 2;
      #     shadowOffsetY = 3;
      #     language = "";
      #     allowPanelsOnScreenWithoutBar = true;
      #   };
      #   ui = {
      #     fontDefault = "JetBrainsMono Nerd Font";
      #     fontFixed = "JetBrainsMono Nerd Font";
      #     fontDefaultScale = 1;
      #     fontFixedScale = 1;
      #     tooltipsEnabled = true;
      #     panelBackgroundOpacity = 0;
      #     panelsAttachedToBar = true;
      #     settingsPanelAttachToBar = false;
      #   };
      #   location = {
      #     name = "London";
      #     weatherEnabled = true;
      #     weatherShowEffects = true;
      #     useFahrenheit = false;
      #     use12hourFormat = false;
      #     showWeekNumberInCalendar = false;
      #     showCalendarEvents = true;
      #     showCalendarWeather = true;
      #     analogClockInCalendar = false;
      #     firstDayOfWeek = -1;
      #   };
      #   calendar = {
      #     cards = [
      #       {
      #         enabled = true;
      #         id = "calendar-header-card";
      #       }
      #       {
      #         enabled = true;
      #         id = "calendar-month-card";
      #       }
      #       # {
      #       #   enabled = true;
      #       #   id = "timer-card";
      #       # }
      #       {
      #         enabled = true;
      #         id = "weather-card";
      #       }
      #     ];
      #   };
      #   screenRecorder = {
      #     directory = "";
      #     frameRate = 60;
      #     audioCodec = "opus";
      #     videoCodec = "h264";
      #     quality = "very_high";
      #     colorRange = "limited";
      #     showCursor = true;
      #     audioSource = "default_output";
      #     videoSource = "portal";
      #   };
      #   wallpaper = {
      #     enabled = false;
      #   };
      #   appLauncher = {
      #     enableClipboardHistory = false;
      #     enableClipPreview = true;
      #     position = "center";
      #     pinnedExecs = [];
      #     useApp2Unit = false;
      #     sortByMostUsed = true;
      #     terminalCommand = "xterm -e";
      #     customLaunchPrefixEnabled = false;
      #     customLaunchPrefix = "";
      #     viewMode = "list";
      #   };
      #   controlCenter = {
      #     position = "close_to_bar_button";
      #     shortcuts = {
      #       left = [
      #         {
      #           id = "WiFi";
      #         }
      #         {
      #           id = "Bluetooth";
      #         }
      #       ];
      #       right = [
      #         {
      #           id = "PowerProfile";
      #         }
      #         {
      #           id = "NightLight";
      #         }
      #       ];
      #     };
      #     cards = [
      #       {
      #         enabled = true;
      #         id = "profile-card";
      #       }
      #       {
      #         enabled = true;
      #         id = "shortcuts-card";
      #       }
      #       {
      #         enabled = true;
      #         id = "audio-card";
      #       }
      #       {
      #         enabled = true;
      #         id = "weather-card";
      #       }
      #       {
      #         enabled = true;
      #         id = "media-sysmon-card";
      #       }
      #     ];
      #   };
      #   systemMonitor = {
      #     cpuWarningThreshold = 80;
      #     cpuCriticalThreshold = 90;
      #     tempWarningThreshold = 80;
      #     tempCriticalThreshold = 90;
      #     memWarningThreshold = 80;
      #     memCriticalThreshold = 90;
      #     diskWarningThreshold = 80;
      #     diskCriticalThreshold = 90;
      #     cpuPollingInterval = 3000;
      #     tempPollingInterval = 3000;
      #     memPollingInterval = 3000;
      #     diskPollingInterval = 3000;
      #     networkPollingInterval = 3000;
      #     useCustomColors = false;
      #     warningColor = "";
      #     criticalColor = "";
      #   };
      #   dock = {
      #     enabled = true;
      #     displayMode = "auto_hide";
      #     backgroundOpacity = 1;
      #     floatingRatio = 1;
      #     size = 1;
      #     onlySameOutput = true;
      #     monitors = [];
      #     pinnedApps = [];
      #     colorizeIcons = false;
      #   };
      #   network = {
      #     wifiEnabled = true;
      #   };
      #   sessionMenu = {
      #     enableCountdown = true;
      #     countdownDuration = 10000;
      #     position = "center";
      #     showHeader = true;
      #     powerOptions = [
      #       {
      #         action = "lock";
      #         enabled = true;
      #       }
      #       {
      #         action = "suspend";
      #         enabled = true;
      #       }
      #       {
      #         action = "hibernate";
      #         enabled = true;
      #       }
      #       {
      #         action = "reboot";
      #         enabled = true;
      #       }
      #       {
      #         action = "logout";
      #         enabled = true;
      #       }
      #       {
      #         action = "shutdown";
      #         enabled = true;
      #       }
      #     ];
      #   };
      #   notifications = {
      #     enabled = true;
      #     monitors = [];
      #     location = "top_right";
      #     overlayLayer = true;
      #     backgroundOpacity = 1;
      #     respectExpireTimeout = false;
      #     lowUrgencyDuration = 3;
      #     normalUrgencyDuration = 8;
      #     criticalUrgencyDuration = 15;
      #     enableKeyboardLayoutToast = true;
      #   };
      #   osd = {
      #     enabled = true;
      #     location = "top_right";
      #     autoHideMs = 2000;
      #     overlayLayer = true;
      #     backgroundOpacity = 1;
      #     enabledTypes = [
      #       0
      #       1
      #       2
      #     ];
      #     monitors = [];
      #   };
      #   audio = {
      #     volumeStep = 5;
      #     volumeOverdrive = false;
      #     cavaFrameRate = 30;
      #     visualizerType = "linear";
      #     visualizerQuality = "high";
      #     mprisBlacklist = [];
      #     preferredPlayer = "";
      #     externalMixer = "pwvucontrol || pavucontrol";
      #   };
      #   brightness = {
      #     brightnessStep = 5;
      #     enforceMinimum = true;
      #     enableDdcSupport = false;
      #   };
      #   colorSchemes = {
      #     useWallpaperColors = false;
      #     predefinedScheme = "Noctalia (default)";
      #     darkMode = true;
      #     schedulingMode = "off";
      #     manualSunrise = "06:30";
      #     manualSunset = "18:30";
      #     matugenSchemeType = "scheme-fruit-salad";
      #     generateTemplatesForPredefined = true;
      #   };
      #   nightLight = {
      #     enabled = false;
      #     forced = false;
      #     autoSchedule = true;
      #     nightTemp = "4000";
      #     dayTemp = "6500";
      #     manualSunrise = "06:30";
      #     manualSunset = "18:30";
      #   };
      #   changelog = {
      #     lastSeenVersion = "";
      #   };
      #   hooks = {
      #     enabled = false;
      #     wallpaperChange = "";
      #     darkModeChange = "";
      #   };
      # };
      settings = {
        appLauncher = {
          customLaunchPrefix = "";
          customLaunchPrefixEnabled = false;
          enableClipPreview = true;
          enableClipboardHistory = false;
          pinnedExecs = [
          ];
          position = "center";
          sortByMostUsed = true;
          terminalCommand = "xterm -e";
          useApp2Unit = false;
          viewMode = "list";
        };
        audio = {
          cavaFrameRate = 30;
          externalMixer = "pwvucontrol || pavucontrol";
          mprisBlacklist = [
          ];
          preferredPlayer = "";
          visualizerQuality = "high";
          visualizerType = "linear";
          volumeOverdrive = false;
          volumeStep = 5;
        };
        bar = {
          backgroundOpacity = 1;
          capsuleOpacity = 1;
          density = "default";
          exclusive = true;
          floating = true;
          marginHorizontal = {
          };
          marginVertical = {
          };
          monitors = [
          ];
          outerCorners = true;
          position = "top";
          showCapsule = true;
          widgets = {
            center = [
              {
                hideMode = "hidden";
                hideWhenIdle = false;
                id = "MediaMini";
                maxWidth = 145;
                scrollingMode = "hover";
                showAlbumArt = false;
                showArtistFirst = true;
                showProgressRing = true;
                showVisualizer = false;
                useFixedWidth = false;
                visualizerType = "linear";
              }
            ];
            left = [
              {
                icon = "rocket";
                id = "CustomButton";
                leftClickExec = "qs -c noctalia-shell ipc call launcher toggle";
                leftClickUpdateText = false;
                maxTextLength = {
                  horizontal = 10;
                  vertical = 10;
                };
                middleClickExec = "";
                middleClickUpdateText = false;
                parseJson = false;
                rightClickExec = "";
                rightClickUpdateText = false;
                textCollapse = "";
                textCommand = "";
                textIntervalMs = 3000;
                textStream = false;
                wheelDownExec = "";
                wheelDownUpdateText = false;
                wheelExec = "";
                wheelMode = "unified";
                wheelUpExec = "";
                wheelUpUpdateText = false;
                wheelUpdateText = false;
              }
              {
                characterCount = 2;
                followFocusedScreen = false;
                hideUnoccupied = false;
                id = "Workspace";
                labelMode = "index";
              }
            ];
            right = [
              {
                blacklist = [
                ];
                colorizeIcons = false;
                drawerEnabled = true;
                id = "Tray";
                pinned = [
                ];
              }
              {
                hideWhenZero = true;
                id = "NotificationHistory";
                showUnreadBadge = true;
              }
              {
                displayMode = "onhover";
                id = "Volume";
              }
              {
                colorizeDistroLogo = false;
                colorizeSystemIcon = "none";
                customIconPath = "";
                enableColorization = false;
                icon = "noctalia";
                id = "ControlCenter";
                useDistroLogo = false;
              }
              {
                customFont = "";
                formatHorizontal = "HH:mm ddd, MMM dd";
                formatVertical = "HH mm - dd MM";
                id = "Clock";
                useCustomFont = false;
                usePrimaryColor = false;
              }
            ];
          };
        };
        brightness = {
          brightnessStep = 5;
          enableDdcSupport = false;
          enforceMinimum = true;
        };
        calendar = {
          cards = [
            {
              enabled = true;
              id = "calendar-header-card";
            }
            {
              enabled = true;
              id = "calendar-month-card";
            }
            {
              enabled = true;
              id = "weather-card";
            }
          ];
        };
        changelog = {
          lastSeenVersion = "";
        };
        colorSchemes = {
          darkMode = true;
          generateTemplatesForPredefined = true;
          manualSunrise = "06:30";
          manualSunset = "18:30";
          matugenSchemeType = "scheme-fruit-salad";
          predefinedScheme = "Noctalia (default)";
          schedulingMode = "off";
          useWallpaperColors = false;
        };
        controlCenter = {
          cards = [
            {
              enabled = true;
              id = "profile-card";
            }
            {
              enabled = true;
              id = "shortcuts-card";
            }
            {
              enabled = true;
              id = "audio-card";
            }
            {
              enabled = true;
              id = "weather-card";
            }
            {
              enabled = true;
              id = "media-sysmon-card";
            }
          ];
          position = "close_to_bar_button";
          shortcuts = {
            left = [
              {
                id = "WiFi";
              }
              {
                id = "Bluetooth";
              }
            ];
            right = [
              {
                id = "PowerProfile";
              }
              {
                id = "NightLight";
              }
            ];
          };
        };
        dock = {
          backgroundOpacity = 1;
          colorizeIcons = false;
          displayMode = "auto_hide";
          enabled = true;
          floatingRatio = 1;
          monitors = [
          ];
          onlySameOutput = true;
          pinnedApps = [
          ];
          size = 1;
        };
        general = {
          allowPanelsOnScreenWithoutBar = true;
          animationDisabled = false;
          animationSpeed = 1;
          avatarImage = "/home/dan/.face";
          boxRadiusRatio = 1;
          compactLockScreen = false;
          dimmerOpacity = {
          };
          enableShadows = true;
          forceBlackScreenCorners = false;
          iRadiusRatio = 1;
          language = "";
          lockOnSuspend = true;
          radiusRatio = 1;
          scaleRatio = 1;
          screenRadiusRatio = 1;
          shadowDirection = "bottom_right";
          shadowOffsetX = 2;
          shadowOffsetY = 3;
          showHibernateOnLockScreen = false;
          showScreenCorners = false;
        };
        hooks = {
          darkModeChange = "";
          enabled = false;
          wallpaperChange = "";
        };
        location = {
          analogClockInCalendar = false;
          firstDayOfWeek = -1;
          name = "London";
          showCalendarEvents = true;
          showCalendarWeather = true;
          showWeekNumberInCalendar = false;
          use12hourFormat = false;
          useFahrenheit = false;
          weatherEnabled = true;
          weatherShowEffects = true;
        };
        network = {
          wifiEnabled = true;
        };
        nightLight = {
          autoSchedule = true;
          dayTemp = "6500";
          enabled = false;
          forced = false;
          manualSunrise = "06:30";
          manualSunset = "18:30";
          nightTemp = "4000";
        };
        notifications = {
          backgroundOpacity = 1;
          criticalUrgencyDuration = 15;
          enableKeyboardLayoutToast = true;
          enabled = true;
          location = "top_right";
          lowUrgencyDuration = 3;
          monitors = [
          ];
          normalUrgencyDuration = 8;
          overlayLayer = true;
          respectExpireTimeout = false;
        };
        osd = {
          autoHideMs = 2000;
          backgroundOpacity = 1;
          enabled = true;
          enabledTypes = [
            0
            1
            2
          ];
          location = "top_right";
          monitors = [
          ];
          overlayLayer = true;
        };
        screenRecorder = {
          audioCodec = "opus";
          audioSource = "default_output";
          colorRange = "limited";
          directory = "";
          frameRate = 60;
          quality = "very_high";
          showCursor = true;
          videoCodec = "h264";
          videoSource = "portal";
        };
        sessionMenu = {
          countdownDuration = 10000;
          enableCountdown = true;
          position = "center";
          powerOptions = [
            {
              action = "lock";
              enabled = true;
            }
            {
              action = "suspend";
              enabled = true;
            }
            {
              action = "hibernate";
              enabled = true;
            }
            {
              action = "reboot";
              enabled = true;
            }
            {
              action = "logout";
              enabled = true;
            }
            {
              action = "shutdown";
              enabled = true;
            }
          ];
          showHeader = true;
        };
        settingsVersion = 26;
        systemMonitor = {
          cpuCriticalThreshold = 90;
          cpuPollingInterval = 3000;
          cpuWarningThreshold = 80;
          criticalColor = "";
          diskCriticalThreshold = 90;
          diskPollingInterval = 3000;
          diskWarningThreshold = 80;
          memCriticalThreshold = 90;
          memPollingInterval = 3000;
          memWarningThreshold = 80;
          networkPollingInterval = 3000;
          tempCriticalThreshold = 90;
          tempPollingInterval = 3000;
          tempWarningThreshold = 80;
          useCustomColors = false;
          warningColor = "";
        };
        templates = {
          alacritty = false;
          cava = false;
          code = false;
          discord = false;
          emacs = false;
          enableUserTemplates = false;
          foot = false;
          fuzzel = false;
          ghostty = false;
          gtk = false;
          kcolorscheme = false;
          kitty = false;
          niri = false;
          pywalfox = false;
          qt = false;
          spicetify = false;
          telegram = false;
          vicinae = false;
          walker = false;
          wezterm = false;
        };
        ui = {
          fontDefault = "JetBrainsMono Nerd Font";
          fontDefaultScale = 1;
          fontFixed = "JetBrainsMono Nerd Font";
          fontFixedScale = 1;
          panelBackgroundOpacity = 0;
          panelsAttachedToBar = true;
          settingsPanelAttachToBar = false;
          tooltipsEnabled = true;
        };
        wallpaper = {
          directory = "/home/dan/Pictures/Wallpapers";
          enableMultiMonitorDirectories = false;
          enabled = false;
          fillColor = "#000000";
          fillMode = "crop";
          hideWallpaperFilenames = false;
          monitorDirectories = [
          ];
          overviewEnabled = false;
          panelPosition = "follow_bar";
          randomEnabled = false;
          randomIntervalSec = 300;
          recursiveSearch = false;
          setWallpaperOnAllMonitors = true;
          transitionDuration = 1500;
          transitionEdgeSmoothness = {
          };
          transitionType = "random";
          useWallhaven = false;
          wallhavenCategories = "111";
          wallhavenOrder = "desc";
          wallhavenPurity = "100";
          wallhavenQuery = "";
          wallhavenResolutionHeight = "";
          wallhavenResolutionMode = "atleast";
          wallhavenResolutionWidth = "";
          wallhavenSorting = "relevance";
        };
      };
    };
  };
}
