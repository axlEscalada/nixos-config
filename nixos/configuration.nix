# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, programs, musnix, lib, ... }:
# let
  # commit-font = import ../derivations/fonts.nix {
    # inherit lib;
    # fetchzip = pkgs.fetchzip;
  # };
# in
{
  imports =
    [ # Include the results of the xhardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader = {
    systemd-boot.enable = false;
    efi = {
      canTouchEfiVariables = true;
      # assuming /boot is the mount point of the  EFI partition in NixOS (as the installation section recommends).
      efiSysMountPoint = "/boot";
    };
    grub = {
      # despite what the configuration.nix manpage seems to indicate,
      # as of release 17.09, setting device to "nodev" will still call
      # `grub-install` if efiSupport is true
      # (the devices list is not used by the EFI grub install,
      # but must be set to some value in order to pass an assert in grub.nix)
      devices = [ "nodev" ];
      efiSupport = true;
      enable = true;
      version = 2;
      useOSProber = true;
      fontSize = 35;
      timeout = 5;
    };
  };
  #GPU
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Argentina/Buenos_Aires";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_AR.UTF-8";
    LC_IDENTIFICATION = "es_AR.UTF-8";
    LC_MEASUREMENT = "es_AR.UTF-8";
    LC_MONETARY = "es_AR.UTF-8";
    LC_NAME = "es_AR.UTF-8";
    LC_NUMERIC = "es_AR.UTF-8";
    LC_PAPER = "es_AR.UTF-8";
    LC_TELEPHONE = "es_AR.UTF-8";
    LC_TIME = "es_AR.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    exportConfiguration = true;
    layout = "us,es";
    xkbOptions = "eurosign:e, compose:menu, grp:alt_space_toggle";
    xkbVariant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.axl = {
    isNormalUser = true;
    description = "axl";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  users.extraUsers.axl.extraGroups = [ "jackaudio" ];
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.sessionVariables = {
    WRL_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  environment.systemPackages = with pkgs; [
    #zls
    #waybar
    eww
    dunst
    #neovim
    kitty
    neofetch
    #zsh
    alacritty
   # wezterm
    libnotify
    #rofi-wayland
    firefox
    slack 
    pulseaudio
    pamixer
    libreoffice-qt
  ];

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  security.rtkit.enable = true;
  services.blueman.enable = true;
  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };
  #FLATPACK
  services.flatpak.enable = true;

  #Enable headset buttons control media player
  systemd.user.services.mpris-proxy = {
      description = "Mpris proxy";
      after = [ "network.target" "sound.target" ];
      wantedBy = [ "default.target" ];
      serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
  };
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable experimental features
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
     experimental-features = nix-command flakes
    '';
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

  programs.hyprland.enable = true;

  fonts.fontDir.enable = true;
  fonts.packages= with pkgs; [
    commit-mono
  ];
}
