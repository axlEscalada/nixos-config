{
  config,
  pkgs,
  lib,
  ...
}: {

  programs.helix = {
    enable = true;
    #settings = builtins.readFile ./configuration.toml;
    #languages = builtins.readFile ./languages.toml;
  };

  home.file.".config/helix/config.toml".text = builtins.readFile ./config.toml;
  home.file.".config/helix/languages.toml".text = builtins.readFile ./languages.toml;
}
