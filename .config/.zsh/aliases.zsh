############################################
# File: aliases.zsh
# Description: K ZSH shell aliases
# Author: Kevin
# Last Modified: 18 Jul 2022, 21:15
############################################


# SUFFIX ALIASES
alias -s json=$VISUAL
alias -s txt=$EDITOR
alias -s md=$EDITOR
alias -s pdf=sioyek
alias -s m3u8=iina

# VARIOUS TERMINAL
alias l="ls_extended -1G"
alias ls="ls_extended"
alias lsa="ls_extended -AG"
alias "ls -a"="ls_extended -aG"
alias ll="ls_extended -Alh"
alias c="clear"
alias cdc="cd && clear"
alias ".."="cd .."
alias "..,.."="cd ../.."
alias ZQ="exit"
alias hh="history"
alias oa="open -a"
alias o="open"
# open with default text editor ($EDITOR = nvim)
alias oe="open -t"
alias ka="killall"
alias {nv,vi,vim}="nvim"
alias snvim="sudo -E nvim"
alias rmh="rm $HOME/.cache/.zsh_history"
alias cpwd="echo $PWD | pbcopy"
alias pgrep="pgrep -l"
alias python=python3.9
alias icat="kitty +kitten icat --align=left"

# APPS
alias preview="open -a Preview"
alias safari="open -a Safari"
alias photos="open -a Photos"
alias iina="open -a IINA"

# HTOP STUFF
alias cpu="(which htop > /dev/null && htop --sort-key PERCENT_CPU) || top -o cpu"
alias ram="(which htop > /dev/null && htop --sort-key PERCENT_MEM) || top -o rsize"

# HOMEBREW
alias br="brew"
alias bri="brew install"
alias bruu="brew update && brew upgrade" 
alias brrm="brew remove"
alias brs="brew search"
alias brcu="brew cu -a --cleanup"

# JAVA
alias java11="/usr/local/opt/java11/bin/java"

# HBLOCK
alias adb=hblock
alias adboff="hblock -S none -D none"
