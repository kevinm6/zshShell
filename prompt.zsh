#############################################################
#------------------------ PROMPT ---------------------------#
#############################################################

# Build 300721


precmd() {
	vcs_info
} 

# Options
vi_mode_ins=${vi_mode_ins:-'%F{blue}[ ins ]%f'}
vi_mode_cmd=${vi_mode_cmd:-'%F{yellow}[ cmd ]%f'}
vi_mode_symbol="${vi_mode_ins}" #initialize mode


zle-keymap-select() { # on keymap change, define the mode and redraw prompt
	if [ "${KEYMAP}" = 'vicmd' ]; then
		vi_mode_symbol="${vi_mode_cmd}"
	else
		vi_mode_symbol="${vi_mode_ins}"
	fi
	zle reset-prompt
}
zle -N zle-keymap-select

# reset to default mode at the end of line input reading
zle-line-finish() {
	vi_mode_symbol="${vi_mode_symbol}"
}
zle -N zle-line-finish

TRAPINT() {
	vi_mode_symbol="${vi_mode_ins}"
	return $(( 128 + $1 ))
}

RPROMPT=$'$vi_mode_symbol  ⌚️ %F{white}%*%f'
PROMPT=$'\n  %# %F{blue}%4~%f\t${vcs_info_msg_0_}\n '


