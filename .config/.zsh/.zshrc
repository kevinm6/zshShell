############################################
# File: .zshrc
# Description:  ZSH Shell (using Kitty Terminal kitty 'https://sw.kovidgoyal.net/kitty')
# Author: Kevin
# Last Modified: 30 Jun 2022, 10:25
############################################

# Vim mode
bindkey -v # enable vi mode and set it to main
export KEYTIMEOUT=1 # timeout for keybinds
# emulate -LR zsh   <-- RESET TO DEFAULT ZSH OPTIONS

# loading zsh mv command
autoload zmv
autoload -U colors && colors
autoload -Uz vcs_info

autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
zmodload zsh/zpty # useful for NeoVim cmp-zsh
_comp_options+=(globdots)		# Include hidden files.

# Edit line in vim w/ ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line 


# Source ZDOTDIR on iCloud Drive
typeset -A sources # declare sources as array
sources=(
  [OPTIONS]="$ZDOTDIR/options.zsh"
  [BINDKEYS]="$ZDOTDIR/binds.zsh"
  [ALIASES]="$ZDOTDIR/aliases.zsh"
  [FUNCTIONS]="$ZDOTDIR/functions.zsh"
  [PROMPT]="$ZDOTDIR/prompt.zsh"
  [AUTOSUGGESTION]=$(brew --prefix)"/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
)

for key value in ${(kv)sources}; do
	[[ -a $value ]] && 
		source $value || echo "\t ⚠️  $key File not found!"
done

# Case sensitive for autocompletion
CASE_SENSITIVE="true"

COMPLETION_WAITING_DOTS="true"

DISABLE_AUTO_TITLE="true"

# HISTORY CONFIGURATION
HISTSIZE=6000
SAVEHIST=6000
HISTFILE="$XDG_CACHE_HOME/.zsh_history"

# Basic auto/tab complete
autoload -Uz compinit
[ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump) ] &&
  compinit || compinit -C

zstyle ':completion:*' menu select # select completions with arrow keys

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit
  compinit
fi

# PLUGINS
plugins=(
  git
  vim
  brew
  man
  osx
  python
  zsh-syntax-highlighting
  h-autosuggestions
)


# kitty-integration
if [[ -n $KITTY_INSTALLATION_DIR ]]; then
  export KITTY_SHELL_INTEGRATION="enabled"
  autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
  kitty-integration
  unfunction kitty-integration
fi
