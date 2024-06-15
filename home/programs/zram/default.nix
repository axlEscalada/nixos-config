{
  config,
  pkgs,
  ...
}: {
  programs.zramSwap = {
    enable = true;
    algorithm = "zstd";
  };
}
