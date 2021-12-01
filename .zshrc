#-------------------------------------------
# File: .zshrc
# Description:  ZSH Shell with iTerm2
# Author: Kevin
# Source: https://github.com/kevinm6/zsh/
# Last Modified: 30.11.21 19:34
#-------------------------------------------


# Vim mode {
	bindkey -v # enable vi mode and set it to main
	export KEYTIMEOUT=1 # timeout for keybinds
# }
# emulate -LR zsh   <-- RESET TO DEFAULT ZSH OPTIONS

# loading zsh mv command
autoload zmv
autoload -U colors && colors
autoload -Uz vcs_info


# Edit line in vim w/ ctrl-e {
	autoload edit-command-line; zle -N edit-command-line
	bindkey '^e' edit-command-line 
# }

# Source ZDOTDIR on iCloud Drive {
	typeset -A sources # declare sources as array
	sources=(
		[OPTIONS]="$ZDOTDIR/options.zsh"
		[BINDKEYS]="$ZDOTDIR/binds.zsh"
		[ALIASES]="$ZDOTDIR/aliases.zsh"
		[FUNCTIONS]="$ZDOTDIR/functions.zsh"
		[PROMPT]="$ZDOTDIR/prompt.zsh"
	)
# }

# VScode? {
	if [ "$TERM_PROGRAM" = "vscode" ]
	then
		typeset -A scs # declare sources as array
		scs=(
			[OPTIONS]="$ZDOTDIR/options.zsh"
			[PROMPT]="$ZDOTDIR/prompt.zsh"
			[BINDKEYS]="$ZDOTDIR/binds.zsh"
			[ALIASES]="$ZDOTDIR/aliases.zsh"
		)	
		for key value in ${(kv)scs}; do
			[[ -a $value ]] && 
				source $value || echo "\t ⚠️  $key File not found!"
		done
		exit
	fi
# }

for key value in ${(kv)sources}; do
	[[ -a $value ]] && 
		source $value || echo "\t ⚠️  $key File not found!"
done


# HISTORY CONFIGURATION {
	HISTSIZE=6000
	SAVEHIST=6000
	HISTFILE="$ZDOTDIR/.zsh_history"
# }

# Basic auto/tab complete {
	autoload -Uz compinit && compinit
	zstyle ':completion:*' menu select # select completions with arrow keys

	if type brew &>/dev/null; then
		FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
		autoload -Uz compinit
		compinit
	fi
# }

# PLUGINS {
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

test -e "${ZDOTDIR}/.iterm2_shell_integration.zsh" && source "${ZDOTDIR}/.iterm2_shell_integration.zsh"

