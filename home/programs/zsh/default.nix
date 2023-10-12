{ config, pkgs, lib, ... }:

{  

    programs = {
        zsh = {
            enable = true;
            oh-my-zsh = {
                enable = true;
                #theme = "powerlevel10k/powerlevel10k";
                plugins = [
                    "git"
                ];
            };
	    plugins = [
	      {
	    	name = "powerlevel10k";
	    	src = pkgs.zsh-powerlevel10k;
	    	file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
	     }
	     {
		name = "powerlevel10k-config";
		src = lib.cleanSource ./p10k-config;
	        file = "p10k.zsh";
	     }
	    ];
            enableAutosuggestions = true;
            enableCompletion = true;
            enableSyntaxHighlighting = true;
        };
    };

    home.file.".zshrc".text = ''
	export PATH=$HOME/bin:/usr/local/bin:$PATH
	# Path to your oh-my-zsh installation.
	export ZSH="$HOME/.oh-my-zsh"

	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


	#ZSH_THEME="powerlevel10k/powerlevel10k"
	#REFINED_CHAR_SYMBOL="⚡"

	# Rofi
	export PATH=$HOME/.config/rofi/scripts:$PATH
	export PATH=$PATH:~/Apps

	# Pipewire
	export SDL_AUDIODRIVER=pipewire
	export ALSOFT_DRIVERS=pipewire
    '';
}
