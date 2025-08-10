{ ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      background = {
        monitor = "";
        path = "~/Downloads/Anime-Girl2.png";
        blur_passes = 3;
        contrast = 0.8916; # Remove quotes - should be number
        brightness = 0.8172; # Remove quotes
        vibrancy = 0.1696; # Remove quotes
        vibrancy_darkness = 0.0; # Remove quotes
      };

      general = {
        # Remove these - they don't exist in v0.8.2
        # no_fade_in = false;
        # disable_loading_bar = true;
        grace = 0;
      };

      input-field = {
        monitor = "";
        size = "250, 50";
        outline_thickness = 3;
        dots_size = 0.26; # Remove quotes - should be number
        dots_spacing = 0.64; # Remove quotes
        dots_center = true;
        dots_rounding = -1; # Remove quotes
        rounding = 22; # Remove quotes
        outer_color = "rgba(0, 0, 0, 0)";
        inner_color = "rgba(0, 0, 0, 0.5)";
        font_color = "rgb(237, 237, 237)"; # Fix RGB format
        fade_on_empty = true;
        placeholder_text = "<i><span foreground=\"##cdd6f4\">Password...</span></i>";
        position = "0, -120";
        halign = "center";
        valign = "center";
      };

      label = [
        {
          monitor = "";
          text = "cmd[update:1000] echo \"$(date +\"%-I:%M%p\")\"";
          color = "rgba(255, 255, 255, 0.6)"; # Replace $foreground
          font_size = 120;
          font_family = "JetBrains Mono Nerd Font Mono ExtraBold";
          position = "0, -300";
          halign = "center";
          valign = "top";
        }
        {
          monitor = "";
          text = "cmd[update:1000] echo \"$(playerctl metadata --format '{{title}} {{artist}}')\"";
          color = "rgba(255, 255, 255, 0.6)"; # Replace $foreground
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
