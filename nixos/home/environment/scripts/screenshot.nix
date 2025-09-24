{pkgs, ...}: let
  screenshotScript = pkgs.writeShellScriptBin "screenshot" ''
    #!/usr/bin/env bash

    # TODO: setup sops for this secret
    TOKEN_FILE="$HOME/.scripts/.screenshot-token"
    if [ ! -f "$TOKEN_FILE" ]; then
      ${pkgs.libnotify}/bin/notify-send "Screenshot Upload" "Auth token file not found at $TOKEN_FILE! Will not upload screenshot" -u critical
      exit 1
    fi

    AUTH_TOKEN=$(cat "$TOKEN_FILE")
    RANDOM_NAME=$(tr -dc 'a-zA-Z0-9' </dev/urandom | head -c 6)
    SCREENSHOT_PATH="/tmp/$RANDOM_NAME.png"
    ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" "$SCREENSHOT_PATH"

    if [ ! -f "$SCREENSHOT_PATH" ]; then
      ${pkgs.libnotify}/bin/notify-send "Screenshot Upload" "Screenshot failed!" -u critical
      exit 1
    fi

    if command -v ${pkgs.wl-clipboard}/bin/wl-copy &>/dev/null; then
      ${pkgs.wl-clipboard}/bin/wl-copy < "$SCREENSHOT_PATH"
    fi

    UPLOAD_URL="https://avrg.dev/api/upload?wait=true"
    RESPONSE=$(${pkgs.curl}/bin/curl -s -X POST \
      -F "file=@$SCREENSHOT_PATH" \
      -u "$AUTH_TOKEN" \
      "$UPLOAD_URL")

    UPLOAD_LINK=$(echo "$RESPONSE" | ${pkgs.jq}/bin/jq -r '.link')

    if echo "$RESPONSE" | grep -q "http"; then
      if command -v ${pkgs.wl-clipboard}/bin/wl-copy &>/dev/null; then
        echo -n "$UPLOAD_LINK" | ${pkgs.wl-clipboard}/bin/wl-copy
      fi
      ${pkgs.libnotify}/bin/notify-send "Upload successful! Link copied to clipboard" \
        -u normal -i "$SCREENSHOT_PATH" -a "Screenshot Upload"
      ${pkgs.pipewire}/bin/pw-play ${./../../../../.scripts/TaskCompletedSound.wav}
    else
      ${pkgs.libnotify}/bin/notify-send -a "Screenshot Upload" "Upload failed: $RESPONSE" -u critical
    fi

    rm "$SCREENSHOT_PATH"
  '';
in {
  options.scripts.screenshot = pkgs.lib.mkOption {
    type = pkgs.lib.types.package;
    default = screenshotScript;
    description = "Script to take and upload a screenshot";
  };
}
