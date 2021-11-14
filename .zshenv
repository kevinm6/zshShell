############################################
# File: .zshenv
# Description: Zsh Enviroment configuration file
# Author: Kevin
# Source: https://github.com/kevinm6/zsh/
# Last Modified: 06.11.21 12:30
############################################


# SHELL
export SHELL=/bin/zsh
export TERM=xterm-256color
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH=$PATH:/Library/Apple/usr/bin:/Users/Kevin/.local/bin/

#export DISPLAY="DISPLAY 0.0"

# Set default apps
export EDITOR=nvim
export VISUAL=vimr
export BROWSER="/Applications/Safari.app"

# Set default directories
# ZSH 
export ZDOTDIR="$HOME/Documents/Devices/Backup_Files/Shell/.zsh"
export XDG_CONFIG_HOME="/Users/Kevin/.config"

# Bin Backup path
export BINBACKPATH="$HOME/Documents/Devices/Backup_Files/Shell/bin/"

# NVIM
export NVIMDOTDIR="$XDG_CONFIG_HOME/nvim"

# VIM
export VIMDOTDIR="$XDG_CONFIG_HOME/vim"

# VIMR
export MYGVIMRC="$NVIMDOTDIR/ginit.vim"

export MYVIMRC="$NVIMDOTDIR/init.vim"
export VIMINIT="source $MYVIMRC"

# NANO
export NANOINIT="source $HOME/.config/nano/nanorc"

# PYTHON
export PYTHON="/usr/local/opt/python@3.10/bin"
export PATH="/usr/local/opt/python@3.10/bin:$PATH"

# appending to path
# java -> setting java11 as default
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/usr/local/opt/openjdk/include"

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
# export PATH="$PROG2HOME/.bin:$PATH"

# POSTGRES
export PATH="/usr/local/opt/postgresql@13/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/postgresql@13/lib"
# export CPPFLAGS="-I/usr/local/opt/postgresql@13/include"

# Source zsh highlight
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR="/usr/local/share/zsh-syntax-highlighting/highlighters/"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

