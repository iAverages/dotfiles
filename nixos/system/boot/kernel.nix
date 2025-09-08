{
  lib,
  pkgs,
  config,
  ...
}: {
  boot.kernelPackages = pkgs.linuxPackages_6_16;

  # TODO: move to obs?
  # virtual camera
  boot.kernelModules = ["v4l2loopback"];
  boot.extraModulePackages = with config.boot.kernelPackages; [v4l2loopback.out];
  boot.extraModprobeConfig = ''
    # exclusive_caps: Skype, Zoom, Teams etc. will only show device when actually streaming
    # card_label: Name of virtual camera, how it'll show up in Skype, Zoom, Teams
    # https://github.com/umlaeute/v4l2loopback
    options v4l2loopback exclusive_caps=1 card_label="Virtual Camera"
  '';

  # Workaround for SuspendThenHibernate: https://lore.kernel.org/linux-kernel/20231106162310.85711-1-mario.limonciello@amd.com/
  boot.kernelParams = lib.optionals (lib.versionOlder config.boot.kernelPackages.kernel.version "6.8") ["rtc_cmos.use_acpi_alarm=1"];
}
