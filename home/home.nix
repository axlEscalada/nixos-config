{ hyprland, pkgs, inputs, ...}: 
let
  nvchad = with pkgs; callPackage ../derivations/nvchad.nix { };
in
{

  imports = [
    hyprland.homeManagerModules.default
    #./environment
    ./programs
    ./scripts
    ./themes
  ];

  home = {
    username = "axl";
    homeDirectory = "/home/axl";
  };

  home.packages = (with pkgs; [
    #lang
    zigpkgs.master
    
    nvchad
    #User Apps
    celluloid
    discord
    librewolf
    bibata-cursors
    vscode
    lollypop
    lutris
    openrgb
    betterdiscord-installer
    neovim-unwrapped

    #utils
    ripgrep
    jq
    ranger
    wlr-randr
    git
    gnumake
    catimg
    curl
    appimage-run
    xflux
    dunst
    pavucontrol

    #misc 
    cava
    nano
    rofi
    nitch
    wget
    grim
    slurp
    wl-clipboard
    pamixer
    mpc-cli
    tty-clock
    eza
    btop

  ]) ++ (with pkgs.gnome; [ 
    nautilus
    zenity
    gnome-tweaks
    eog
    gedit
  ]);

  programs.home-manager.enable = true;

  home.stateVersion = "23.05";
}
