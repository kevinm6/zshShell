###########################################################################
#-------------------------  K ZSH Configuration --------------------------#
###########################################################################

# Build 200721

set rtp+="$HOME/Documents/Devices/Backup_Files/Shell/vim/vimrc"

# Vim mode
bindkey -v # enable vi mode and set it to main
export KEYTIMEOUT=1 # timeout for keybinds

# emulate -LR zsh   <-- RESET TO DEFAULT ZSH OPTIONS

# ------------------------- SHELL PROMPT ------------------------- {
setopt PROMPT_SUBST
autoload colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn

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


# Edit line in vim w/ ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line 

sources=(
	$ZDOTDIR/options.zsh
	$ZDOTDIR/binds.zsh
	$ZDOTDIR/aliases.zsh
	$ZDOTDIR/functions.zsh
)

for source in $sources; do
	[[ -a $source ]] && 
		source $source || echo "\t ⚠️  $source File not found!"
done


# ------------------------- HISTORY CONFIGURATION ------------------------- {
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$ZDOTDIR/.zsh_history"


# Basic auto/tab complete
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select # select completions with arrow keys

if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
	autoload -Uz compinit
	compinit
fi
# }

# ------------------------- PLUGINS ------------------------- {
plugins=(
	vim
	brew
	man
	osx
	python
	zsh-syntax-highlighting
	h-autosuggestions
)
# }
