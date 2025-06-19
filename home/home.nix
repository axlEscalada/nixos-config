{
  nixvim,
  hyprland,
  zls-flake,
  pkgs,
  ...
}:
{
  imports = [
    hyprland.homeManagerModules.default
    ./programs
    ./scripts
  ];

  home = {
    username = "axl";
    homeDirectory = "/home/axl";
  };

  home.packages = (
    with pkgs;
    [
      #editor
      nixvim.packages.${pkgs.system}.default
      zed-editor
      # jetbrains.idea-community
      jetbrains.idea-ultimate
      android-studio
      code-cursor

      #file explorer
      pcmanfm
      #img viewer
      loupe

      #terminal
      ghostty

      xorg.libXext
      xorg.libXrender
      xorg.libXtst
      xorg.libXi

      #lang
      zls-flake.packages.${pkgs.system}.zls
      zigpkgs.master
      jdk21
      freetype
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
      kooha # screerecorder
      recapp # screenrecorder
      gparted
      foliate
      kdePackages.okular
      spotify
      obsidian
      vscode
      piper # mouseconfig
      libratbag
      burpsuite
      android-tools

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
      bazel

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
      grim # screenshot
      slurp # screenposition
      wl-clipboard
      wl-clipboard-x11
      pamixer
      mpc-cli
      tty-clock
      eza
      btop
      wlogout
      # nerdfonts
      # copyq

      #bluetooth
      kdePackages.bluedevil
      bluez
      # bluez-qt
      gedit

      zenity
      gnome-tweaks
      eog
    ]
  );

  programs.home-manager.enable = true;

  home.stateVersion = "23.05";
}
