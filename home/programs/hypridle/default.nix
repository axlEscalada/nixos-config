{
  config,
  inputs,
  pkgs,
  lib,
  ...
}: let
  inherit (inputs) hypridle;
in {
  services.hypridle = {
    enable = true;
    package = hypridle.packages.${pkgs.system}.hypridle;

    settings = {
      # general = {
      #   after_sleep_cmd = "${getExe' config.wayland.windowManager.hyprland.package "hyprctl"} dispatch dpms on";
      #   ignore_dbus_inhibit = false;
      #   lock_cmd = "${getExe config.programs.hyprlock.package}";
      # };

      listener = [
        {
          timeout = 600; # 10min
          on-timeout = "hyprlock"; # command to run when timeout has passed
          on-resume = "notify-send \"Welcome back!\""; # command to run when activity is detected after timeout has fired.
        }
        {
          timeout = 900; # 15min
          on-timeout = "hyprctl dispatch dpms off"; # command to run when timeout has passed
          on-resume = "hyprctl dispatch dpms on"; # command to run when activity is detected after timeout has fired.
        }
      ];
    };
  };
}
