#-------------------------------------------
# File: prompt.zsh
# Description: K ZSH Shell prompt
# Author: Kevin
# Source: https://github.com/kevinm6/zsh/
# Last Modified: 30/11/2021 - 17:35
#-------------------------------------------

precmd() {
	[[ -z ${vcs_info_msg_0_} ]] && {
		# No information from vcs_info
		# Increase verbosing parent dirs
		PROMPT=$'\n  %# %F{blue}%6%f\n '
	} || {
		PROMPT=$'\n  %# %F{blue}%3~%f\t%B%F{red} ${vcs_info_msg_0_}%f%b\n '
	}
}

function zle-line-init zle-keymap-select {
		case ${KEYMAP} in
      (vicmd)      VI_MODE="%F{yellow\}-- NORMAL --%f" ;;
      (main|viins) VI_MODE="%F{blue}-- INSERT --%f" ;;
      (*)          VI_MODE="%F{blue}-- INSERT --%f" ;;
    esac
    RPROMPT="$VI_MODE ⌚️ %F{white}%*%f"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

