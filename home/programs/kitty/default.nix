{ config
, pkgs
, ...
}: {
  home.file.".config/kitty/rose-pine-custom.conf".text = ''
    ## name: Rosé Pine Custom
    foreground               #575279
    background               #050505
    selection_foreground     #575279
    selection_background     #dfdad9

    cursor                   #cecacd
    cursor_text_color        #575279

    url_color                #907aa9

    active_tab_foreground    #575279
    active_tab_background    #f2e9e1
    inactive_tab_foreground  #9893a5
    inactive_tab_background  #faf4ed

    active_border_color      #575279
    inactive_border_color    #dfdad9

    # black
    color0   #f2e9e1
    color8   #9893a5

    # red
    color1   #b4637a
    color9   #b4637a

    # green
    color2   #575279
    color10  #575279

    # yellow
    color3   #ea9d34
    color11  #ea9d34

    # blue
    color4   #56949f
    color12  #56949f

    # magenta
    color5   #907aa9
    color13  #907aa9

    # cyan
    color6   #d7827e
    color14  #d7827e

    # white
    color7   #575279
    color15  #575279
  '';
  home.file.".config/kitty/kitty.conf".text = ''
    # vim:ft=kitty

    #zshell
    shell zsh

    #theme
    include ./theme.conf

    # Remove close window confirm
    confirm_os_window_close 0

    # Font config
    font_family      jetbrains mono nerd font
    bold_font        jetbrains mono nerd font
    italic_font      jetbrains mono nerd font
    bold_italic_font jetbrains mono nerd font

    font_size 10.0

    # Window padding
    window_padding_width 8

    background_opacity 0.8

    # The basic colors
    #foreground              #CDD6F4
    #background              #1E1E2E
    selection_foreground    #1E1E2E
    selection_background    #F5E0DC

    # Cursor colors
    cursor                  #F5E0DC
    cursor_text_color       #1E1E2E

    # URL underline color when hovering with mouse
    url_color               #F5E0DC

    copy_on_select yes

    # Kitty window border colors
    active_border_color     #B4BEFE
    inactive_border_color   #6C7086
    bell_border_color       #F9E2AF

    # OS Window titlebar colors
    wayland_titlebar_color system
    macos_titlebar_color system

    #keybinds

    # map alt+1 send_text all \x021
    # map alt+2 send_text all \x022
    # map alt+3 send_text all \x023
    # map alt+4 send_text all \x024
    # map alt+5 send_text all \x025
    # map alt+6 send_text all \x026
    # map alt+7 send_text all \x027
    # map alt+8 send_text all \x028
    # map alt+9 send_text all \x029
    # map alt+0 send_text all \x020
    # map alt+t send_text all \x02t
    # map alt+w send_text all \x02w
    # map alt+e send_text all \x02%
    # map alt+shift+e send_text all \x02"
    # map alt+shift+left send_text all \x02l
    # map alt+shift+right send_text all \x02h
    # map alt+shift+up send_text all \x02k
    # map alt+shift+down send_text all \x02j

    # Tab bar colors
    active_tab_foreground   #11111B
    active_tab_background   #CBA6F7
    inactive_tab_foreground #CDD6F4
    inactive_tab_background #181825
    tab_bar_background      #11111B

    # Colors for marks (marked text in the terminal)
    mark1_foreground #1E1E2E
    mark1_background #B4BEFE
    mark2_foreground #1E1E2E
    mark2_background #CBA6F7
    mark3_foreground #1E1E2E
    mark3_background #74C7EC

    # The 16 terminal colors

    # black
    color0 #45475A
    color8 #585B70

    # red
    color1 #F38BA8
    color9 #F38BA8

    # green
    color2  #A6E3A1
    color10 #A6E3A1

    # yellow
    color3  #F9E2AF
    color11 #F9E2AF

    # blue
    color4  #89B4FA
    color12 #89B4FA

    # magenta
    color5  #F5C2E7
    color13 #F5C2E7

    # cyan
    color6  #94E2D5
    color14 #94E2D5

    # white
    color7  #BAC2DE
    color15 #A6ADC8
  '';
}
