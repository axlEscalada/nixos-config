{
  inputs,
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
    inputs.zen-browser.homeModules.beta
  ];

  home = {
    username = "axl";
    homeDirectory = "/home/axl";
  };

  home.packages = (
    with pkgs;
    [
      #Desktop ui
      inputs.quickshell.packages.${pkgs.system}.default
      #editor
      nixvim.packages.${pkgs.system}.default
      zed-editor
      # jetbrains.idea-community
      # jetbrains.idea-ultimate #failing at 18/07/25
      android-studio
      code-cursor

      #file explorer
      nautilus
      # pcmanfm
      #img viewer
      loupe

      #terminal
      ghostty

      xorg.libXext
      xorg.libXrender
      xorg.libXtst
      xorg.libXi

      #Desktop
      # inputs.marble.packages.${pkgs.system}.default

      #lang
	  lua-language-server
	  clang-tools
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

      # Browser
      brave
      google-chrome

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
      psmisc
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
      bat

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

	  #neovim tools
	  lazygit

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
  programs.zen-browser.enable = true;

  home.stateVersion = "23.05";
}
