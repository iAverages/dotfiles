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
          viewMode = "grid";
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
          backgroundOpacity = 0.45;
          capsuleOpacity = 1;
          density = "comfortable";
          exclusive = true;
          floating = true;
          marginHorizontal = 0.25;
          marginVertical = 0.25;
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
                maxWidth = 600;
                scrollingMode = "never";
                showAlbumArt = false;
                showArtistFirst = true;
                showProgressRing = false;
                showVisualizer = false;
                useFixedWidth = false;
                visualizerType = "mirrored";
              }
            ];
            left = [
              {
                icon = "rocket";
                id = "CustomButton";
                leftClickExec = "noctalia-shell ipc call launcher toggle";
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
                showUnreadBadge = false;
              }
              {
                displayMode = "onhover";
                id = "Volume";
              }
              {
                colorizeDistroLogo = false;
                colorizeSystemIcon = "primary";
                customIconPath = "";
                enableColorization = true;
                icon = "noctalia";
                id = "ControlCenter";
                useDistroLogo = true;
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
            {
              enabled = false;
              id = "timer-card";
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
          enabled = false;
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
          dimmerOpacity = 0;
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
          weatherShowEffects = false;
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
          backgroundOpacity = 0.45;
          criticalUrgencyDuration = 30;
          enableKeyboardLayoutToast = true;
          enabled = true;
          location = "top_right";
          lowUrgencyDuration = 3;
          monitors = [
            "HDMI-A-1"
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
              command = "";
              countdownEnabled = true;
              enabled = true;
            }
            {
              action = "suspend";
              command = "";
              countdownEnabled = true;
              enabled = true;
            }
            {
              action = "hibernate";
              command = "";
              countdownEnabled = true;
              enabled = true;
            }
            {
              action = "reboot";
              command = "";
              countdownEnabled = true;
              enabled = true;
            }
            {
              action = "logout";
              command = "";
              countdownEnabled = true;
              enabled = true;
            }
            {
              action = "shutdown";
              command = "";
              countdownEnabled = true;
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
          panelBackgroundOpacity = 0.45;
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
          transitionEdgeSmoothness = 0.05;
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
