############################################
# File: .zshenv
# Description: K Zsh Shell Enviroment configuration file
# Author: Kevin
# Last Modified: 14 Jul 2022, 09:47
############################################

# SHELL
export SHELL=/bin/zsh
export TERM=xterm-256color
export LANG="en_US.UTF-8"
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$PATH:/Library/Apple/usr/bin" #"/usr/local/opt/coreutils/libexec/gnubin"
export PATH="/usr/local/clamav/bin:/usr/local/clamav/sbin:$PATH"
#export DISPLAY="DISPLAY 0.0"
export KITTY_CONFIG_DIRECTORY="$HOME/.MacDotfiles/kitty/.config/kitty"

export WINEPREFIX=~/.wine64 WINEARCH=win64 winecfg

# Homebrew
export HOMEBREW_BAT=true
export HOMEBREW_BAT_CONFIG_PATH="$HOME/.config/bat/config"
export HOMEBREW_CASK_OPTS="--appdir=/Applications --fontdir=/Library/Fonts"
export HOMEBREW_CLEANUP_PERIODIC_FULL_DAYS=16
export HOMEBREW_CLEANUP_MAX_AGE_DAYS=90
export HOMEBREW_NO_ANALYTICS=true
export HOMEBREW_NO_ENV_HINTS=false
export HOMEBREW_BUNDLE_FILE="$HOME/.MacDotfiles/Brewfile"

# Set default apps
export EDITOR=nvim
export VISUAL=vimr
export BROWSER="/Applications/Safari.app"
export CS="$HOME/Documents/@M&K/Personal/Kevin/Informatica/"
export DOTFILES="$HOME/.MacDotfiles"

# ZSH & Base Directories
export XDG_CONFIG_HOME="/Users/Kevin/.config"
export XDG_LOCAL_HOME="/Users/Kevin/.local"
export XDG_CACHE_HOME="/Users/Kevin/.cache"
export ZDOTDIR="$XDG_CONFIG_HOME/.zsh"
export BINBACKPATH="$HOME/.local/bin"
export PATH="$PATH:$BINBACKPATH"


# Package Managers
# NPM
export PATH="$PATH:$HOME/.cache/.npm/.global-modules/bin:$HOME/.cache/.npm/node_modules/.bin"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/.npm/.npmrc"

# RUST / CARGO
export CARGO_HOME="$HOME/.cache/.cargo"

# Editors

# NVIM
export NVIMDOTDIR="$XDG_CONFIG_HOME/nvim"
export MYVIMRC="$NVIMDOTDIR/init.lua"
export VIMINIT="source $MYVIMRC"

# VIM
export VIMDOTDIR="$XDG_CONFIG_HOME/vim"

# VIMR
export PATH="/Applications/VimR.app/Contents/Resources/vimr:$PATH"

# NANO
export NANOINIT="source $HOME/.config/nano/nanorc"

# curl
export PATH="/usr/local/opt/curl/bin:$PATH"

# LESS (disable history file)
export LESSHISTFILE=-


#### LANGUAGES ####

# PYTHON
export PYTHON="/usr/local/opt/python/bin"
export PATH="/usr/local/opt/python/bin:$PATH"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc.py"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/.jupyter"


# JAVA
# java -> setting java17 as default
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export JTDLS_HOME="$HOME/.local/share/nvim/lsp_servers/jdtls"
export CPPFLAGS="-I/usr/local/opt/openjdk/include"
export JDTLS_JVM_ARGS="-javaagent:$HOME/.local/share/nvim/lsp_servers/jdtls/lombok.jar"

# GO
export GOPATH="$XDG_CONFIG_HOME/go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# POSTGRES
export PATH="$PATH:/usr/local/opt/postgresql@13/bin"
export PSQL_HISTORY="$HOME/.cache/.psql_history"

# PERL
export PERL_HOME="$HOME/.cache/.cpan"

# RUBY
export GEM_HOME="$HOME/.cache/.gem"

# Mono framework
export PATH="$PATH:/Library/Frameworks/Mono.framework/Versions/Current/Commands"

# Source zsh highlight
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR="/usr/local/share/zsh-syntax-highlighting/highlighters/"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# completions
export FPATH="$ZDOTDIR:$FPATH"
