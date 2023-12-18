{ hyprland, zls-flake, pkgs, language-servers, ...}: 
let
  nvchad = with pkgs; callPackage ../derivations/nvchad.nix { };
in
{
  imports = [
    hyprland.homeManagerModules.default
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
    zls-flake.packages.${pkgs.system}.zls
    zigpkgs.master
    jdk17
    language-servers.packages.${pkgs.system}.jdt-language-server
    maven
    nodejs
    rustc
    cargo
    python3
    python3.pkgs.pip    
    go
    gopls
    docker-compose

    #nvchad
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
    brave
    google-chrome
    kooha#screerecorder
    recapp#screenrecorder
    ollama
    gparted
    # transmission-gtk

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
    awscli2

    #misc 
    cava
    nano
    rofi
    nitch
    wget
    grim#screenshot
    slurp#screenposition
    wl-clipboard
    pamixer
    mpc-cli
    tty-clock
    eza
    btop
    
    #bluetooth
    bluedevil
    bluez
    # bluez-qt

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
