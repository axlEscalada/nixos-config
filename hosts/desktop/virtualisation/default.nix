{ config, pkgs, user, ... }:

{
  virtualisation = {
    docker.enable = true;
    # Enable libvirt/QEMU
    libvirtd = {
      enable = true;
      onBoot = "ignore";
      onShutdown = "shutdown";
      qemu = {
        package = pkgs.qemu;
        ovmf.enable = true;
        swtpm.enable = true;
      };
    };
  };

  # Add system service explicitly
  systemd.services.libvirtd = {
    enable = true;
    wantedBy = [ "multi-user.target" ];
    requires = [ "virtlogd.service" ];
  };

  # Enable dconf
  programs.dconf.enable = true;

  # Add groups
  users.groups.docker.members = [ "axl" ];
  users.users.axl.extraGroups = [ "libvirtd" "kvm" ];

  # Add packages
  environment.systemPackages = with pkgs; [
    docker-compose
    virt-manager
    virt-viewer
    spice-gtk
    spice-protocol
    qemu
    libvirt
  ];
}
