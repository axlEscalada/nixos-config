{pkgs, ...}: {
  services.transmission = {
    enable = true;
    package = pkgs.transmission;
    openFirewall = true;
    openRPCPort = true;
    settings = {
      home = "";
      download-dir = "/home/axl/complete";
      incomplete-dir = "/home/axl/incomplete";
      watch-dir = "/home/axl/watch";
      watch-dir-enabled = false;
      rpc-bind-address = "0.0.0.0";
      rpc-port = 9091;
      rpc-host-whitelist = "192.168.1.245";
      rpc-whitelist = "192.168.1.*";
    };
  };
}