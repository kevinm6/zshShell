#############################################################
#-----------------------  ZSHENV  --------------------------#
#############################################################

## Version 23.10.21 - 14:00

# Exports
export SHELL=/bin/zsh
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH=$PATH:/Library/Apple/usr/bin:/Users/Kevin/.local/bin/

#export DISPLAY="DISPLAY 0.0"

# Set default apps
export XDG_CONFIG_HOME="/Users/Kevin/.config/"
export EDITOR=nvim
export VISUAL=vimr
export BROWSER="/Applications/Safari.app"

# Set default directories
# ZSH 
export ZDOTDIR="$HOME/Documents/Devices/Backup_Files/Shell/.zsh"

# NEOVIM
export NVIMDOTDIR="$XDG_CONFIG_HOME/nvim"
export MYNVIMRC="$NVIMDOTDIR/init.vim"
export NVIMINIT="source $MYNVIMRC"

# VIM
export VIMDOTDIR="$XDG_CONFIG_HOME/vim"
export MYVIMRC="$VIMDOTDIR/vimrc"
export VIMINIT="source $MYVIMRC"

# NANO
export NANOINIT="source $HOME/.config/nano/nanorc"

# PYTHON
export PYTHON="/usr/local/opt/python/libexec/bin/python"

# appending to path
# java -> setting java11 as default
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
export CPPFLAGS="-I/usr/local/opt/openjdk@11/include"

# curl
export PATH=/usr/local/opt/curl/bin:$PATH

# python
export PATH=/usr/local/opt/python/libexec/bin:$PATH

# go
export GOPATH="$HOME/.config/go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# PROGRAMMAZIONE II
export PROG2HOME="/Users/Kevin/Informatica/2°Anno/1°Semestre/Programmazione II/RepoEsercitazioni/esercitazioni"
export PATH="$PROG2HOME/.bin:$PATH"

# POSTGRES
# export PATH="/usr/local/opt/postgresql@13/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/postgresql@13/lib"
# export CPPFLAGS="-I/usr/local/opt/postgresql@13/include"

# Source zsh highlight
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR="/usr/local/share/zsh-syntax-highlighting/highlighters/"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

