#-------------------------------------------
# File: prompt.zsh
# Description: K ZSH Shell prompt
# Author: Kevin
# Source: https://github.com/kevinm6/zsh/
# Last Modified: 30.11.21 21:35
#-------------------------------------------

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats "%{$fg_bold[red]%}on  %b %m %{$reset_color%} %{$fg[yellow]%}%u%f%{$reset_color%} %{$fg[green]%}%c%f%{$reset_color%} "
zstyle ':vcs_info:git*' actionformats '%s  %r/%S %b (%a) %m %u %c '
zstyle ':vcs_info:*' check-for-changes true

precmd() { 
	vcs_info

	[[ -z ${vcs_info_msg_0_} ]] && {
		# No information from vcs_info
		# Increase verbosing parent dirs
		pathlen=6
		msg=""
	} || {
		msg=$' ${vcs_info_msg_0_}'
		pathlen=3
	}
}

# PROMPT=$'\n  %# %F{blue}%$pathlen~%f\t%B%F{red} ${vcs_info_msg_0_}%f%b\n'
PROMPT=$'\n %# %F{blue}%$pathlen~%f   ${vcs_info_msg_0_}\n '

function zle-line-init zle-keymap-select {
		case ${KEYMAP} in
      (vicmd)      VI_MODE="%F{yellow}-- NORMAL --%f" ;;
      (main|viins) VI_MODE="%F{blue}-- INSERT --%f" ;;
      (*)          VI_MODE="%F{blue}-- INSERT --%f" ;;
    esac
    RPROMPT='$VI_MODE  ⌚️ %F{white}%*%f'
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

setopt prompt_subst

