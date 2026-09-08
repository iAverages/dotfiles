{pkgs, ...}: let
  tomlFormat = pkgs.formats.toml {};
in {
  home = {
    packages = with pkgs; [
      herdr
    ];

    file.".config/herdr/config.toml".source = tomlFormat.generate "herdr-config" {
      keys = {
        prefix = "ctrl+m";
      };
      session = {
        resume_agents_on_restore = false;
      };
      onboarding = false;

      ui.toast = {
        delivery = "system";
      };

      theme = {
        name = "rose-pine";
        auto_switch = false;
      };
    };
  };
}
