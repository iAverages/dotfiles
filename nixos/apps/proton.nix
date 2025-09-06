{pkgs, ...}
: {
  environment.systemPackages = [
    # refused to open on wayland, use x11 for now
    (pkgs.protonmail-desktop.overrideAttrs
      (oldAttrs: {
        postInstall =
          (oldAttrs.postInstall or "")
          + ''
            sed -i \
              's|^Exec=proton-mail %U$|Exec=env XDG_SESSION_TYPE=x11 proton-mail %U|' \
              usr/share/applications/proton-mail.desktop
          '';
      }))
  ];
}
