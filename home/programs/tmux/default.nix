{
  config,
  pkgs,
  lib,
  ...
}: {

  programs.tmux = {
    enable = true;
    extraConfig = '' 
    	# changing prefix from 'Ctrl+b' to 'Alt+b'

    	unbind C-b

    	set-option -g prefix C-b
    	set -g mouse on
    	# Start windows and panes at 1, not 0
    	set -g base-index 1
    	setw -g pane-base-index 1
    	# Ensure window index numbers get reordered on delete.
    	set-option -g renumber-windows on

      set-option -g default-shell ${pkgs.zsh}/bin/zsh
      # Set status bar and message style to empty (no color)
      set -g status-style ""
      set -g message-style ""

    	bind-key C-b send-prefix

    	bind-key -n M-t new-window
    	bind-key -n M-w kill-window
    	bind-key -n M-Right next-window
    	bind-key -n M-Left previous-window

    	bind h select-pane -L                           # Select pane to the left
    	bind j select-pane -D                           # Select pane below
    	bind k select-pane -U                           # Select pane above
    	bind l select-pane -R                           # Select pane to the right
    	bind t new-window -c "#{pane_current_path}"     # New window
    	bind w kill-pane                                # Close current pane

    	set -sg escape-time 0
    '';
  };
}
