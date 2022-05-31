############################################
# File: binds.zsh
# Description: K keybinds zsh shell
# Author: Kevin
# Source: https://github.com/kevinm6/zsh/
# Last Modified: 18/03/2022 - 10:19
############################################


# VIM Mode
bindkey -M vicmd "j" vi-down-line-or-history
bindkey -M vicmd "k" vi-up-line-or-history

# Use vim keys in tab complete menu:
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history
bindkey -M menuselect '^[[Z' vi-up-line-or-history
bindkey -v '^?' backward-delete-char

# CMD
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "<leader>\033b" backward-word
bindkey "<leader>\033f" forward-word

# CTRL key
bindkey "^u" backward-kill-line
bindkey "^w" backward-kill-word
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# YANK to system clipboard
function vi-yank-xclip {
  zle vi-yank
  echo "$CUTBUFFER" | pbcopy -i
}

zle -N vi-yank-xclip
bindkey -M vicmd 'y' vi-yank-xclip
