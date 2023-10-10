{ config, pkgs, user, ... }:

{
  virtualisation = {
    docker.enable = true;
  };

  users.groups.docker.members = [ "axl" ];

  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
