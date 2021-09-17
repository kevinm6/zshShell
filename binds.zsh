#############################################################
#----------------------- BINDKEYS --------------------------#
#############################################################

# Version 29.07.21

# vi mode
bindkey -M vicmd "j" vi-down-line-or-history
bindkey -M vicmd "k" vi-up-line-or-history

# cmd
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "<leader>\033b" backward-word
bindkey "<leader>\033f" forward-word

# alt
bindkey "\033b" backward-word
bindkey "\033f" forward-word

# ctrl
bindkey "^u" backward-kill-line
bindkey "^w" backward-kill-word
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

