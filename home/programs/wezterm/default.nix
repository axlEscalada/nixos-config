{
  config,
  pkgs,
  ...
}: {
  programs.wezterm = {
    enable = true;
    extraConfig = builtins.readFile ./wezterm.lua;
  };

  home.file.".config/wezterm/colors/purple.toml".text = builtins.readFile ./colors/purple.toml;
}
