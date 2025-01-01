{ config, pkgs, lib, ... }: {
  programs = {
    zsh = {
      enable = true;
      oh-my-zsh.enable = false;
      enableAutosuggestions = false;
      enableCompletion = false; # Temporarily disable
      enableSyntaxHighlighting = false;
      
      initExtra = ''
        # Basic setup
        HISTFILE="$HOME/.zsh_history"
        HISTSIZE=10000
        SAVEHIST=10000

        # History options
        setopt HIST_FCNTL_LOCK
        setopt HIST_IGNORE_DUPS
        setopt HIST_IGNORE_SPACE
        setopt SHARE_HISTORY
        setopt NO_GLOBAL_RCS

        # Simple prompt
        PS1='%F{green}%n@%m%f %F{blue}%~%f %# '
      '';
    };
  };

  home.file.".zshrc".text = '''';
}
