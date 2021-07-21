#############################################################
#-----------------------  ZSHENV  --------------------------#
#############################################################

## Build 200721

#Exports
export SHELL=/bin/zsh
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:/usr/bin:$PATH"
#export DISPLAY="DISPLAY 0.0"

# Set default apps
export EDITOR=vi
export VISUAL=vim
export BROWSER=Safari

# Set default directories
export ZDOTDIR="$HOME/.config/.zsh/"
export VIMINIT="source $HOME/.config/vim/vimrc"
export NANOINIT="source $HOME/.config/nano/nanorc"

# Set default paths
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"

# Source zsh highlight
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
