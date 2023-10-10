{ config, lib, pkgs, ... }:

{
    programs.waybar = {
      enable = true;
      systemd = {
        enable = false;
        target = "graphical-session.target";
      };
      style = bultins.readFile ./style.css;
      settings = [{
	    "position"= "top";
	    "layer"= "top";
	    "height"= 16;
	    "margin-top"= 0;
	    "margin-bottom"= 0;
	    "margin-left"= 0;
	    "margin-right"= 0;
        modules-left = [
	"custom/launcher"
	"hyprland/workspaces" 
	"custom/playerctl" 
	"custom/playerlabel"
	];
        modules-center = [
          "cpu"
	  "memory"
	  "disk"
        ];
        modules-right = [
          "tray"
          "custom/randwall"
          "network"
	  "clock"
	  "pulseaudio"
        ];
	"custom/launcher"= {
          "format"= "󰈸";
          "on-click"= "bash $HOME/.config/rofi/launcher.sh";
          "on-click-right"= "bash $HOME/.config/rofi/run.sh";
        };
	"custom/randwall"= {
	    "format"= "󰏘";
	    "on-click"= "bash $HOME/.config/hypr/randwall.sh";
	    "on-click-right"= "bash $HOME/.config/hypr/wall.sh";
	};
	"hyprland/workspaces"= {
           "active-only"= false;
           "all-outputs"= true;
           "disable-scroll"= false;
           "on-scroll-up"= "hyprctl dispatch workspace -1";
           "on-scroll-down"= "hyprctl dispatch workspace +1";
	   "format"= "{icon}";
	   "on-click"= "activate";
	   "format-icons"= {
	     "urgent"= "";
	     "active"= "";
	     "default"= "󰧞";
             "sort-by-number"= true;
           };
        };
        "custom/cava-internal" = {
          "exec" = "sleep 1s && cava-internal";
          "tooltip" = false;
        };
	"custom/playerctl"= {
	      "format"= "{icon}";
	      "return-type"= "json";
	      "max-length"= 64;
	      "exec"= "playerctl -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
	      "on-click-middle"= "playerctl play-pause";
	      "on-click"= "playerctl previous";
	      "on-click-right"= "playerctl next";
	      "format-icons"= {
		"Playing"= "<span foreground='#E5B9C6'>󰒮 󰐌 󰒭</span>";
		"Paused"= "<span foreground='#928374'>󰒮 󰏥 󰒭</span>";
	      };
	    };

    "custom/playerlabel"= {
      "format"= "<span>{}</span>";
      "return-type"= "json";
      "max-length"= 48;
      "exec"= "playerctl -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\"; \"class\": \"{{status}}\"}' -F";
      "on-click-middle"= "playerctl play-pause";
      "on-click"= "playerctl previous";
      "on-click-right"= "playerctl next";
      "format-icons"= {
        "Playing"= "<span foreground='#E5B9C6'>󰒮 󰐌 󰒭</span>";
        "Paused"= "<span foreground='#928374'>󰒮 󰏥 󰒭</span>";
      };
    };

	"battery"= {
		"states"= {
		    "good"= 95;
		    "warning"= 30;
		    "critical"= 15;
		};
		"format"="{icon}  {capacity}%";
		"format-charging"= "{capacity}% ";
		"format-plugged"= "{capacity}% ";
		"format-alt"= "{icon} {time}";
		"format-icons"= ["" "" "" "" ""];
	};

	  "memory"= {
	    "format"= "󰍛 {}%";
	    "format-alt"= "󰍛 {used}/{total} GiB";
	    "interval"= 5;
	  };

	  "cpu"= {
	    "format"= "󰻠 {usage}%";
	    "format-alt"= "󰻠 {avg_frequency} GHz";
	    "interval"= 5;
	  };

	  "disk"= {
	    "format"= "󰋊 {}%";
	    "format-alt"= "󰋊 {used}/{total} GiB";
	    "interval"= 5;
	    "path"= "/mnt/Datos";
	  };
	
	"tray" = {
		"icon-size"= 16;
		"spacing"= 5;
	};
	"network"= {
	 "format-wifi"= "󰤨";
	 "format-ethernet"= " {ifname}= Aesthetic";
	 "format-linked"= " {ifname} (No IP)";
	 "format-disconnected"= "󰤭";
	 "format-alt"= " {ifname}= {ipaddr}/{cidr}";
          "tooltip-format"= "{essid}";
          "on-click-right"= "nm-connection-editor";
	};
	"backlight"= {
		"format"= "{icon} {percent}%";
		"format-icons"= ["" "" "" "" "" "" "" "" ""];
	};
	"pulseaudio"= {
		"format"= "{icon} {volume}%";
        	"format-muted"= "󰝟";
		"format-icons"= {
			"default"= ["󰕿" "󰖀" "󰕾"];
		};
		"on-click"= "bash ~/.scripts/volume mute";
	    "on-scroll-up"= "bash ~/.scripts/volume up";
	    "on-scroll-down"= "bash ~/.scripts/volume down";
	    "scroll-step"= 5;
		"on-click-right"= "pavucontrol";
	  };
	"custom/wf-recorder"= {
		"format"= "{}";
		"interval"= "once";
		"exec"= "echo ''";
		"tooltip"= "false";
		"exec-if"= "pgrep 'wf-recorder'";
		"on-click"= "exec ./scripts/wlrecord.sh";
		"signal"= 8;
	};
	"custom/hyprpicker"= {
	  "format"= "󰈋";
	  "on-click"= "hyprpicker -a -f hex";
	  "on-click-right"= "hyprpicker -a -f rgb";
	};
        "clock"= {
	  "format"= " {:%H:%M}";
	  "tooltip"= "true";
	  "tooltip-format"= "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
	  "format-alt"= " {:%d/%m}";
	}
        "tray" = {
          "icon-size" = 15;
          "spacing" = 5;
        };
      }];
    };
}
