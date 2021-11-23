#-------------------------------------------
# File: options.zsh
# Description: K ZSH Shell options
# Author: Kevin
# Source: https://github.com/kevinm6/zsh/
# Last Modified: 23.11.21 12:47
#-------------------------------------------


# Various Options {
setopt PROMPT_SUBST
setopt auto_cd
setopt auto_menu
setopt auto_list
setopt correct
setopt vi
setopt no_list_beep
# }


# History options {
	setopt hist_ignore_all_dups # remove older duplicate entries from history
	setopt hist_reduce_blanks # remove superfluous blanks from history items
	setopt share_history # share shell history between different shells
	setopt append_history # add to main history instead of overwrite it
	setopt hist_save_no_dups # do not save duplicates
# }

autoload colors
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn

