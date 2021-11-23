#-------------------------------------------
# File: binds.zsh
# Description: K keybinds zsh shell
# Author: Kevin
# Source: https://github.com/kevinm6/zsh/
# Last Modified: 23.11.21 12:36
#-------------------------------------------


# Vim Mode {
	bindkey -M vicmd "j" vi-down-line-or-history
	bindkey -M vicmd "k" vi-up-line-or-history
# }

# cmd
# bindkey "^[[H" beginning-of-line
# bindkey "^[[F" end-of-line
# bindkey "<leader>\033b" backward-word
# bindkey "<leader>\033f" forward-word

# Ctrl key {
bindkey "^u" backward-kill-line
bindkey "^w" backward-kill-word
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
# }

