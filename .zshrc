###########################################################################
#-------------------------  K ZSH Configuration --------------------------#
###########################################################################

# ZSH Shell with iTerm2
# Version 04.11.21 20:40

# Vim mode
bindkey -v # enable vi mode and set it to main
export KEYTIMEOUT=1 # timeout for keybinds

# emulate -LR zsh   <-- RESET TO DEFAULT ZSH OPTIONS

# loading zsh mv command
autoload zmv

# Edit line in vim w/ ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line 

# Source other configuration files stored in ZDOTDIR on iCloud Drive
typeset -A sources # declare sources as array
sources=(
	[OPTIONS]="$ZDOTDIR/options.zsh"
	[PROMPT]="$ZDOTDIR/prompt.zsh"
	[BINDKEYS]="$ZDOTDIR/binds.zsh"
	[ALIASES]="$ZDOTDIR/aliases.zsh"
	[FUNCTIONS]="$ZDOTDIR/functions.zsh"
)

for key value in ${(kv)sources}; do
	[[ -a $value ]] && 
		source $value || echo "\t ⚠️  $key File not found!"
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

test -e "${ZDOTDIR}/.iterm2_shell_integration.zsh" && source "${ZDOTDIR}/.iterm2_shell_integration.zsh"

