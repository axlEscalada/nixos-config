{ config, lib, pkgs, ... }:

{
    programs.waybar = {
      enable = true;
      systemd = {
        enable = false;
        target = "graphical-session.target";
      };
      style = builtins.readFile ./style.css;
      settings = [{
      layer = "top";
      position = "top";
      height = 33;
      width = 1350;
      margin = "3, 0, 2, 0";

      modules-left = [
        "custom/wmname"
        "sway/workspaces"
        "hyprland/workspaces"
        "sway/mode"
        "cpu"
        "custom/separator"
        "memory"
        "custom/separator"
        "network"
        "custom/recorder"
        "custom/audiorec"
      ];

      modules-center = [ "tray" "mpd" ];

      modules-right = [
        "idle_inhibitor"
        "custom/separator"
        "backlight"
        "custom/separator"
        "battery"
        "custom/separator"
        "pulseaudio"
        "custom/separator"
        "clock"
      ];

      sway.workspaces = {
        disable-scroll = true;
        all-outputs = true;
        format = "{icon}";
        format-icons = {
          "1" = "";
          "2" = "";
          "3" = "";
          "4" = "";
          "5" = "";
          "6" = "";
          "7" = "";
          "8" = "";
          "9" = "";
          urgent = "";
          focused = "";
          default = "";
        };
      };

      custom.wmname = {
        format = "";
        tooltip = false;
      };

      hyprland.workspaces = {
        format = "{icon}";
        format-icons = {
          "1" = "";
          "2" = "";
          "3" = "";
          "4" = "";
          "5" = "";
          "6" = "";
          "7" = "";
          "8" = "";
          "9" = "";
          urgent = "";
          focused = "";
          default = "";
        };
      };

      custom.language = {
        exec = "swaymsg --type get_inputs | grep \"xkb_active_layout_name\" | sed -u '1!d; s/^.*xkb_active_layout_name\": \"//; s/ (US)//; s/\",//' && swaymsg --type subscribe --monitor '[\"input\"]' | sed -u 's/^.*xkb_active_layout_name\": \"//; s/\",.*$//; s/ (US)//'";
      };

      custom.separator = {
        format = "|";
        interval = "once";
        tooltip = false;
      };

      sway.mode = {
        format = "<span style=\"italic\">{}</span>";
      };

      idle_inhibitor = {
        format = "{icon}";
        format-icons = {
          activated = "";
          deactivated = "";
        };
      };

      tray = {
        icon-size = 20;
        spacing = 6;
      };

      clock = {
        interval = 1;
        locale = "C";
        format = " {:%I:%M %p}";
        format-alt = " {:%a,%b %d}";
      };

      cpu = {
        format = "&#8239;{usage}%";
        tooltip = false;
        on-click = "kitty -e 'htop'";
      };

      memory = {
        interval = 30;
        format = " {used:0.2f}GB";
        max-length = 10;
        tooltip = false;
        warning = 70;
        critical = 90;
      };

      temperature = {
        critical-threshold = 80;
        format = "{icon}&#8239;{temperatureC}°C";
        format-icons = ["" "" ""];
      };

      backlight = {
        format = "{icon}&#8239;{percent}%";
        format-icons = ["💡" "💡"];
        on-scroll-down = "brightnessctl -c backlight set 1%-";
        on-scroll-up = "brightnessctl -c backlight set +1%";
      };

      battery = {
        states = {
          warning = 30;
          critical = 15;
        };
        format = "{icon}&#8239;{capacity}%";
        format-charging = "&#8239;{capacity}%";
        format-plugged = "&#8239;{capacity}%";
        format-alt = "{icon} {time}";
        format-icons = ["" "" "" "" ""];
      };

      network = {
        format-wifi = "&#8239;({signalStrength}%)";
        format-ethernet = "&#8239;{ifname}: {ipaddr}/{cidr}";
        format-linked = "&#8239;{ifname} (No IP)";
        format-disconnected = "✈&#8239;Disconnected";
        format-alt = "{ifname}: {ipaddr}/{cidr}";
        tooltip-format = "{essid}: {ipaddr}";
      };

      pulseaudio = {
        format = "{icon} {volume}% {format_source}";
        format-bluetooth = "{icon} {volume}% {format_source}";
        format-bluetooth-muted = " {format_source}";
        format-muted = "  {format_source}";
        format-source = " {volume}%";
        format-source-muted = "";
        format-icons = {
          headphone = "";
          "hands-free" = "";
          headset = "🎧";
          phone = "";
          portable = "";
          car = "";
          default = ["" "" ""];
        };
        on-click = "pavucontrol";
      };

      mpd = {
        format = "{stateIcon} {artist} - {title}";
        format-disconnected = "🎶";
        format-stopped = "♪";
        interval = 10;
        consume-icons = {
          on = " ";
        };
        random-icons = {
          off = "<span color=\"#f53c3c\"></span> ";
          on = " ";
        };
        repeat-icons = {
          on = " ";
        };
        single-icons = {
          on = "1 ";
        };
        state-icons = {
	"paused"= ""; 
        "playing"= "";
        };
       tooltip-format = "MPD (connected)";
       tooltip-format-disconnected = "MPD (disconnected)";
       max-length = 45;
      };
     "custom/recorder" = {
        format = " Rec";
        format-disabled = " Off-air"; # An empty format will hide the module.
        return-type = "json";
        interval = 1;
        exec = "echo '{\"class\": \"recording\"}'";
        exec-if = "pgrep wf-recorder";
      };

      "custom/audiorec" = {
        format = "♬ Rec";
        format-disabled = "♬ Off-air"; #An empty format will hide the module.
        return-type = "json";
        interval = 1;
        exec = "echo '{\"class\": \"audio recording\"}'";
        exec-if = "pgrep ffmpeg";
      };
    }];
  };
}
