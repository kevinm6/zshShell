#############################################################
#-----------------------  ZSHENV  --------------------------#
#############################################################

## Build 280721

#Exports
export SHELL=/bin/zsh
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin

#export DISPLAY="DISPLAY 0.0"

# Set default apps
export EDITOR=vi
export VISUAL=vim
export BROWSER=Safari

# Set default directories
# ZSH 
export ZDOTDIR="$HOME/Documents/Devices/Backup_Files/Shell/.zsh/"
# VIM
export MYVIMRC="$HOME/Documents/Devices/Backup_Files/Shell/vim/vimrc"
export VIMINIT="source $HOME/Documents/Devices/Backup_Files/Shell/vim/vimrc"
# NANO
export NANOINIT="source $HOME/.config/nano/nanorc"

# appending to path
# java
export PATH=/usr/local/opt/openjdk/bin:$PATH
# curl
export PATH=/usr/local/opt/curl/bin:$PATH

# Source zsh highlight
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR="/usr/local/share/zsh-syntax-highlighting/highlighters/"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

