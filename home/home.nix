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
  ];

  home = {
    username = "axl";
    homeDirectory = "/home/axl";
  };

  home.packages =
    (with pkgs; [
      #editor
      nixvim.packages.${pkgs.system}.default
      zed-editor
      jetbrains.idea-community

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
      ##gleam
      gleam
      erlang
      rebar3

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
      gparted
      foliate
      okular
      spotify
      obsidian
      vscode
      piper #mouseconfig
      libratbag

      #utils
      gdb
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
      # cozy
      unixtools.xxd
      nix-index
      udisks

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
