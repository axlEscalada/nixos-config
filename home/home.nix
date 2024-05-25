{
  nixvim,
  hyprland,
  zls-flake,
  pkgs,
  ...
}: {
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

  home.packages =
    (with pkgs; [
      #editor
      nixvim.packages.${pkgs.system}.default

      #lang
      zls-flake.packages.${pkgs.system}.zls
      zigpkgs.master
      jdk17
      gcc
      maven
      nodejs
      rustc
      cargo
      python3
      python3.pkgs.pip
      go
      gopls
      docker-compose

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
      brave
      google-chrome
      kooha #screerecorder
      recapp #screenrecorder
      ollama
      gparted
      foliate

      #utils
      ripgrep
      jq
      ranger
      wlr-randr
      git
      gnumake
      catimg
      curl
      ffmpeg
      appimage-run
      xflux
      dunst
      pavucontrol
      playerctl
      unzip
      unrar
      cozy

      #misc
      cava
      nano
      rofi
      nitch
      wget
      grim #screenshot
      slurp #screenposition
      wl-clipboard
      pamixer
      mpc-cli
      tty-clock
      eza
      btop
      wlogout
      nerdfonts

      #bluetooth
      bluedevil
      bluez
      # bluez-qt
      gedit
    ])
    ++ (with pkgs.gnome; [
      nautilus
      zenity
      gnome-tweaks
      eog
    ]);

  programs.home-manager.enable = true;

  home.stateVersion = "23.05";
}
