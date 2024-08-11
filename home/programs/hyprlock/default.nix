{...}: {
  programs.hyprlock = {
    enable = true;
    settings = {
      background = {
        monitor = "";
        path = "~/Downloads/Anime-Girl2.png";
        blur_passes = 3;
        contrast = "0.8916";
        brightness = "0.8172";
        vibrancy = "0.1696";
        vibrancy_darkness = "0.0";
      };

      # GENERAL
      general = {
        no_fade_in = false;
        grace = 0;
        disable_loading_bar = true;
      };

      # INPUT FIELD
      input-field = {
        monitor = "";
        size = "250, 50";
        outline_thickness = 3;
        dots_size = "0.26"; # Scale of input-field height, 0.2 - 0.8
        dots_spacing = "0.64"; # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true;
        dots_rounding = "-1";
        rounding = "22";
        outer_color = "rgba(0, 0, 0, 0)";
        inner_color = "rgba(0, 0, 0, 0.5)";
        font_color = "rgb(237, 237, 237, 1.0)";
        fade_on_empty = true;
        placeholder_text = "<i><span foreground=\"##cdd6f4\">Password...</span></i>";
        position = "0, -120";
        halign = "center";
        valign = "center";
      };

      # TIME
      label = [
        {
          monitor = "";
          text = "cmd[update:1000] echo \"$(date +\"%-I:%M%p\")\"";
          color = "$foreground";
          #color = rgba(255, 255, 255, 0.6)
          font_size = 120;
          font_family = "JetBrains Mono Nerd Font Mono ExtraBold";
          position = "0, -300";
          halign = "center";
          valign = "top";
        }
        # USER
        # {
        #   monitor = "";
        #   text = "Hi there, $USER";
        #   color = "$foreground";
        #   #color = rgba(255, 255, 255, 0.6)
        #   font_size = 25;
        #   font_family = "JetBrains Mono Nerd Font Mono";
        #   position = "0, -40";
        #   halign = "center";
        #   valign = "center";
        # }
        #Current song
        {
          monitor = "";
          text = "cmd[update:1000] echo \"$(playerctl metadata --format '{{title}}  {{artist}}')\"";
          color = "$foreground";
          #color = "rgba(255, 255, 255, 0.6)";
          font_size = 12;
          font_family = "JetBrains Mono Nerd Font Mono ExtraLight";
          position = "0, 10";
          halign = "center";
          valign = "bottom";
        }
      ];
    };
  };
}
