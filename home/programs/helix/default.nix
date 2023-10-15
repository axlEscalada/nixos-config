{
  config,
  pkgs,
  lib,
  ...
}: {

  programs.helix = {
    enable = true;
  };

  home.file.".config/helix/config.toml".text = builtins.readFile ./config.toml;
  home.file.".config/helix/languages.toml".text = builtins.readFile ./languages.toml;
}
