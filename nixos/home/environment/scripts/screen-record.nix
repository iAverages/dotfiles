{pkgs, ...}: let
  screenrecordScript = pkgs.writeShellScriptBin "screenshot" ''
    #!/usr/bin/env bash

    TEMP_DIR="/tmp"
    PID_FILE="$TEMP_DIR/wf-recorder.pid"
    RECORDINGS_DIR="$HOME/Videos"
    UPLOAD_URL="https://avrg.dev/api/upload"
    RANDOM_NAME=$(tr -dc 'a-zA-Z0-9' </dev/urandom | head -c 6)
    RECORDING_PATH="$RECORDINGS_DIR/$RANDOM_NAME.mp4"
    TOKEN_FILE="$HOME/.scripts/.screenshot-token"

    mkdir -p "$RECORDINGS_DIR"

    if [ -f "$PID_FILE" ]; then
      # Stop the recording
      PID=$(cat "$PID_FILE")
      if ps -p "$PID" &>/dev/null; then
        kill "$PID"
        mv "$TEMP_DIR/recording.mp4" "$RECORDING_PATH" 2>/dev/null
        rm "$PID_FILE"
        ${pkgs.libnotify}/bin/notify-send  -a "Screen Recording" "Recording stopped. File saved to $RECORDING_PATH" -u normal

        if [ ! -f "$TOKEN_FILE" ]; then
          ${pkgs.libnotify}/bin/notify-send  -a "Screen Recording" "Auth token file not found at $TOKEN_FILE! Skipping upload." -u critical
          exit 0
        fi

        AUTH_TOKEN=$(cat "$TOKEN_FILE")

        RESPONSE=$(curl -s -X POST \
          -F "file=@$RECORDING_PATH" \
          -u "$AUTH_TOKEN" \
          "$UPLOAD_URL")

        UPLOAD_LINK=$(echo "$RESPONSE" | jq -r '.link')

        if [[ "$UPLOAD_LINK" != "null" && -n "$UPLOAD_LINK" ]]; then
          echo -n "$UPLOAD_LINK" | wl-copy
          ${pkgs.libnotify}/bin/notify-send -a "Screen Recording" "Upload successful! Link copied to clipboard: $UPLOAD_LINK" -u normal -i "$RECORDING_PATH"
          ${pkgs.pipewire}/bin/pw-play ${./../../../../.scripts/TaskCompletedSound.wav}
        else
          ${pkgs.libnotify}/bin/notify-send -a "Screen Recording" "Upload failed: $RESPONSE" -u critical
        fi

        exit 0
      else
        rm "$PID_FILE"
        ${pkgs.libnotify}/bin/notify-send -a "Screen Recording" "Found stale PID file. Starting new recording." -u critical
      fi
    fi

    REGION=$(${pkgs.slurp}/bin/slurp)
    if [ -z "$REGION" ]; then
      ${pkgs.libnotify}/bin/notify-send -a "Screen Recording" "No region selected." -u critical
      exit 1
    fi

    # Start a new recording with wf-recorder
    ${pkgs.wf-recorder}/bin/wf-recorder -g "$REGION" -f "$TEMP_DIR/recording.mp4" &
    echo $! > "$PID_FILE"

    # Notify the user
    ${pkgs.libnotify}/bin/notify-send -a "Screen Recording" "Recording started. Press your keybind again to stop." -u normal
  '';
in {
  options.scripts.screenrecord = pkgs.lib.mkOption {
    type = pkgs.lib.types.package;
    default = screenrecordScript;
    description = "Script to take and upload a screen recording";
  };
}
