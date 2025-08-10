{
  inputs,
  pkgs,
  ...
}:
let
  hyprland = inputs.hyprland.packages.${pkgs.system}.hyprland;
  playerctl = "${pkgs.playerctl}/bin/playerctl";
  brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
  pactl = "${pkgs.pulseaudio}/bin/pactl";
in
{
  xdg.desktopEntries."org.gnome.Settings" = {
    name = "Settings";
    comment = "Gnome Control Center";
    icon = "org.gnome.Settings";
    exec = "env XDG_CURRENT_DESKTOP=gnome ${pkgs.gnome-control-center}/bin/gnome-control-center";
    categories = [ "X-Preferences" ];
    terminal = false;
  };

  xdg.configFile = {
    "hypr/hyprland.conf".text = ''
      $hypr = ~/.config/hypr
      $hl = $hypr/hyprland
      $cConf = ~/.config/caelestia

      # Variables (colours + other vars)
      exec = cp -L --no-preserve=mode --update=none $hypr/scheme/default.conf $hypr/scheme/current.conf
      source = $hypr/scheme/current.conf
      source = $hypr/variables.conf

      # Shell variables
      exec = touch -a $hypr/shell-vars.conf
      source = $hypr/shell-vars.conf

      # User variables
      exec = mkdir -p $cConf && touch -a $cConf/hypr-vars.conf
      source = $cConf/hypr-vars.conf

      # Default monitor conf
      # monitor = , preferred, auto, 1
      # Monitor configuration
      monitor = DP-3,1920x1080@60,1920x0,1,bitdepth,10
      monitor = HDMI-A-1,1920x1080,0x0,1,bitdepth,10

      # Configs
      source = $hl/env.conf
      source = $hl/general.conf
      source = $hl/input.conf
      source = $hl/misc.conf
      source = $hl/animations.conf
      source = $hl/decoration.conf
      source = $hl/group.conf
      source = $hl/execs.conf
      source = $hl/rules.conf
      source = $hl/keybinds.conf

      # User configs
      exec = mkdir -p $cConf && touch -a $cConf/hypr-user.conf
      source = $cConf/hypr-user.conf
    '';

    "hypr/variables.conf".source = ./hyprland/variables.conf;
    "hypr/scheme/default.conf".source = ./hyprland/scheme/default.conf;
    "hypr/scripts/wsaction.fish" = {
      source = ./hyprland/scripts/wsaction.fish;
      executable = true;
    };
    "hypr/hyprland/env.conf".source = ./hyprland/env.conf;
    "hypr/hyprland/general.conf".source = ./hyprland/general.conf;
    "hypr/hyprland/input.conf".source = ./hyprland/input.conf;
    "hypr/hyprland/misc.conf".source = ./hyprland/misc.conf;
    "hypr/hyprland/animations.conf".source = ./hyprland/animations.conf;
    "hypr/hyprland/decoration.conf".source = ./hyprland/decoration.conf;
    "hypr/hyprland/group.conf".source = ./hyprland/group.conf;
    "hypr/hyprland/execs.conf".source = ./hyprland/execs.conf;
    "hypr/hyprland/rules.conf".source = ./hyprland/rules.conf;
    "hypr/hyprland/keybinds.conf".source = ./hyprland/keybinds.conf;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = hyprland;
    systemd.enable = true;
    xwayland.enable = true;
  };
}
