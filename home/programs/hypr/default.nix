{
  config,
  lib,
  pkgs,
  ...
}: let
  eww = "${pkgs.eww-wayland}/bin/eww";
  #idle = "${pkgs.swayidle}/bin/swayidle";
  #lock = "${pkgs.swaylock}/bin/swaylock";
in {
  imports = [
    ./hyprland-environment.nix
  ];

  home.packages = with pkgs; [
    swww
  ];

  #test later systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    #nvidiaPatches = true;
    extraConfig = ''

      $scriptsDir = $HOME/.config/hypr/scripts
      # Monitor
      monitor=DP-3,1920x1080@144,1920x0,1,bitdepth,10
      monitor=HDMI-A-1,1920x1080,0x0,1,bitdepth,10

      # Fix slow startup
      # exec Hyprland
      exec = systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      exec = dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP # Autostart

      exec-once = hyprctl setcursor Bibata-Modern-Classic 18
      exec-once = dunst

      source = /home/axl/.config/hypr/colors
      # exec = pkill waybar & sleep 0.5 && waybar
      exec-once = ${eww} daemon
      exec-once = swww init
      exec-once = swww img $HOME/Images/wallpapers/bowl.jpg
      # Auto lock

      # Set en layout at startup

      # Input config
      input {
          kb_layout = us
          kb_variant =
          kb_model =
          kb_options =
          kb_rules =

          follow_mouse = 1

          touchpad {
              natural_scroll = false
          }

          sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
      }

      general {
          gaps_in = 5
          gaps_out = 20
          border_size = 0
          col.active_border = rgba(47278cee) rgba(cf76c9ee) 45deg
          col.inactive_border = rgba(595959aa)

          layout = dwindle
      }

      decoration {
          rounding = 8
          blur {
              enabled = true
              size = 7
              passes = 2
              new_optimizations = true
          }

          drop_shadow = true
          shadow_range = 4
          shadow_render_power = 3
          col.shadow = rgba(1a1a1aee)
      }

      animations {
          enabled = yes

          bezier = ease,0.4,0.02,0.21,1

          animation = windows, 1, 3.5, ease, slide
          animation = windowsOut, 1, 3.5, ease, slide
          animation = border, 1, 6, default
          animation = fade, 1, 3, ease
          animation = workspaces, 1, 3.5, ease
      }

      dwindle {
          pseudotile = yes
          preserve_split = yes
      }

      master {
          new_is_master = yes
      }

      gestures {
          workspace_swipe = false
      }

      misc {
        disable_hyprland_logo = true
      }

      # Example windowrule v1
      # windowrule = float, ^(kitty)$
      # Example windowrule v2
      # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$

      #windowrule=float,^(kitty)$
      #windowrule=center,^(kitty)$
      #windowrule=size 1040 670,^(kitty)$
      windowrule=float,^(pavucontrol)$
      windowrule=float,^(blueman-manager)$
      windowrule=size 934 525,^(mpv)$
      windowrule=float,^(mpv)$
      windowrule=center,^(mpv)$
      #windowrule=pin,^(firefox)$

      $mainMod = SUPER
      bind = $mainMod, G, fullscreen,


      #bind = $mainMod, RETURN, exec, cool-retro-term-zsh
      bind = $mainMod, Q, exec, kitty
      bind = $mainMod, T, exec, wezterm
      bind = $mainMod, B, exec, opera --no-sandbox
      bind = $mainMod, L, exec, librewolf
      bind = $mainMod, K, killactive,
      bind = $mainMod, M, exit,
      bind = $mainMod, F, exec, nautilus
      bind = $mainMod, V, togglefloating,
      bind = $mainMod, w, exec, wofi --show drun
      bind = $mainMod, R, exec, rofi --show
      bind = $mainMod, P, pseudo, # dwindle
      bind = $mainMod, J, togglesplit, # dwindle

      # Switch Keyboard Layouts
      bind = $mainMod, SPACE, exec, hyprctl switchxkblayout teclado-gamer-husky-blizzard next

      # Switch blur
      bind = ALT, g, exec, $scriptsDir/glassmorphismToggle

      # bind = , Print, exec, grim -g "$(slurp)" - | wl-copy
      bind = SHIFT ALT, 4, exec, grim -g "$(slurp)" - | wl-copy
      bind = SHIFT ALT, 3, exec, grim -g "$(slurp)"

      # Functional keybinds
      bind =,XF86AudioMicMute,exec,pamixer --default-source -t
      bind =,XF86MonBrightnessDown,exec,light -U 20
      bind =,XF86MonBrightnessUp,exec,light -A 20
      bind =,XF86AudioMute,exec,pamixer -t
      bind =,XF86AudioLowerVolume,exec,pamixer -d 10
      bind =,XF86AudioRaiseVolume,exec,pamixer -i 10
      bind =,XF86AudioPlay,exec,playerctl play-pause
      bind =,XF86AudioPause,exec,playerctl play-pause

      # to switch between windows in a floating workspace
      bind = SUPER,Tab,cyclenext,
      bind = SUPER,Tab,bringactivetotop,

      # Move focus with mainMod + arrow keys
      bind = $mainMod, left, movefocus, l
      bind = $mainMod, right, movefocus, r
      bind = $mainMod, up, movefocus, u
      bind = $mainMod, down, movefocus, d

      # Switch workspaces with mainMod + [0-9]
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10

      # Scroll through existing workspaces with mainMod + scroll
      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow
      bindm = ALT, mouse:272, resizewindow
    '';
  };

  home.file.".config/hypr/colors".text = ''
    $rosewater = 0xfff4dbd6
    $flamingo  = 0xfff0c6c6
    $pink      = 0xfff5bde6
    $mauve     = 0xffc6a0f6
    $red       = 0xffed8796
    $maroon    = 0xffee99a0
    $peach     = 0xfff5a97f
    $green     = 0xffa6da95
    $teal      = 0xff8bd5ca
    $sky       = 0xff91d7e3
    $sapphire  = 0xff7dc4e4
    $blue      = 0xff8aadf4
    $lavender  = 0xffb7bdf8

    $text      = 0xffcad3f5
    $subtext1  = 0xffb8c0e0
    $subtext0  = 0xffa5adcb

    $overlay2  = 0xff939ab7
    $overlay1  = 0xff8087a2
    $overlay0  = 0xff6e738d

    $surface2  = 0xff5b6078
    $surface1  = 0xff494d64
    $surface0  = 0xff363a4f

    $base      = 0xff24273a
    $mantle    = 0xff1e2030
    $crust     = 0xff181926
  '';
}
