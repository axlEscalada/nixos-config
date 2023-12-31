{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = lib.optionals config.programs.alacritty.enable [pkgs.nerdfonts];

  programs.alacritty = {
    enable = true;

    settings = {
      #import = [
      #  "${pkgs.vimPlugins.nightfox-nvim}/extra/carbonfox/nightfox_alacritty.yml"
      #];

      font = {
        normal = {
	  family = "jetbrains mono nerd font";
          #family = "Hack";
          style = "Medium";
        };
        size = 12;
      };
      window = {
        opacity = 0.8;
        padding = {
          x = 12;
          y = 12;
        };
      };
      shell = {
        program = "zsh";
      };
    };
  };
}
