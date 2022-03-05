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

zmodload zsh/datetime

prompt_preexec() {
  prompt_prexec_realtime=${EPOCHREALTIME}
}

prompt_precmd() {
  if (( prompt_prexec_realtime )); then
    local -rF elapsed_realtime=$(( EPOCHREALTIME - prompt_prexec_realtime ))
    local -rF s=$(( elapsed_realtime%60 ))
    local -ri elapsed_s=${elapsed_realtime}
    local -ri m=$(( (elapsed_s/60)%60 ))
    local -ri h=$(( elapsed_s/3600 ))
    if (( h > 0 )); then
      printf -v prompt_elapsed_time '%ih%im' ${h} ${m}
    elif (( m > 0 )); then
      printf -v prompt_elapsed_time '%im%is' ${m} ${s}
    elif (( s >= 10 )); then
      printf -v prompt_elapsed_time '%.2fs' ${s} # 12.34s
    elif (( s >= 1 )); then
      printf -v prompt_elapsed_time '%.3fs' ${s} # 1.234s
    else
      printf -v prompt_elapsed_time '%ims' $(( s*1000 ))
    fi
    unset prompt_prexec_realtime
  else
    # Clear previous result when hitting ENTER with no command to execute
    unset prompt_elapsed_time
  fi
}

setopt nopromptbang prompt{cr,percent,sp,subst}

autoload -Uz add-zsh-hook
add-zsh-hook preexec prompt_preexec
add-zsh-hook precmd prompt_precmd


function zle-line-init zle-keymap-select {
		case ${KEYMAP} in
      (vicmd)      VI_MODE="%F{yellow}-- NORMAL --%f" ;;
      (main|viins) VI_MODE="%F{blue}-- INSERT --%f" ;;
      (*)          VI_MODE="%F{blue}-- INSERT --%f" ;;
    esac
    RPROMPT='$VI_MODE [%F{cyan}${prompt_elapsed_time}%f] ⌚️ %F{white}%*%f'
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

setopt prompt_subst

