{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    extraConfig = ''
      	# changing prefix from 'Ctrl+b' to 'Alt+b'

      	unbind-key C-b

      	set-option -g prefix C-b
      	set -g mouse on
      	# Start windows and panes at 1, not 0
      	set -g base-index 1
      	setw -g pane-base-index 1
      	# Ensure window index numbers get reordered on delete.
      	set-option -g renumber-windows on
        set -g default-terminal "screen"

        set-option -g default-shell ${pkgs.zsh}/bin/zsh
        # Set status bar and message style to empty (no color)
        set -g status-style ""
        set -g message-style ""

      	bind-key C-b send-prefix

        # Use Alt-t to create a new window
      	bind-key -n M-t new-window
        # Use Alt-w to close current window or pane
      	bind-key -n M-w kill-pane
      	bind-key -n M-Right next-window
      	bind-key -n M-Left previous-window

        # Use Alt-<number> to switch to window
        bind-key -n M-1 select-window -t 1
        bind-key -n M-2 select-window -t 2
        bind-key -n M-3 select-window -t 3
        bind-key -n M-4 select-window -t 4
        bind-key -n M-5 select-window -t 5
        bind-key -n M-6 select-window -t 6
        bind-key -n M-7 select-window -t 7
        bind-key -n M-8 select-window -t 8
        bind-key -n M-9 select-window -t 9

        # Use Alt-e to open a pane to the right
        bind-key -n M-e split-window -h

        # Use Alt-Shift-e to open a pane below
        bind-key -n M-E split-window -v

        # Use Alt-h/j/k/l to navigate between panes
        bind-key -n M-h select-pane -L
        bind-key -n M-j select-pane -D
        bind-key -n M-k select-pane -U
        bind-key -n M-l select-pane -R

      	bind-key h select-pane -L                           # Select pane to the left
      	bind-key j select-pane -D                           # Select pane below
      	bind-key k select-pane -U                           # Select pane above
      	bind-key l select-pane -R                           # Select pane to the right
      	bind-key t new-window -c "#{pane_current_path}"     # New window
      	bind-key w kill-pane                                # Close current pane

      	set -sg escape-time 0
    '';
  };
}
