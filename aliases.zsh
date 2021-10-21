#############################################################
#------------------------  ALIAS  --------------------------#
#############################################################

# Version 15.10.21 - 9:00

# ------------------------- SUFFIX ALIASES -------------------------
alias -s json=subl
alias -s txt=vim
alias -s md=vim
alias -s pdf=preview
alias -s m3u8=iina
alias -s todo=vim

# ------------------------- VARIOUS TERMINAL -------------------------
alias l="ls -al"
alias c="clear"
alias cdc="cd && clear"
alias ".."="cd .."
alias "..,.."="cd ../.."
alias :q="exit"
alias hh="history"
alias oa="open -a"
alias o="open"
alias oe="open -e"
alias ka="killall"
alias rmh="rm $ZDOTDIR/.zsh_history"
alias zpath="$ZDOTDIR"
alias vipath="$HOME/Documents/Devices/Backup_Files/Shell/vim/"
alias cppath="echo $PWD | pbcopy"
alias binbackuppath="$HOME/Documents/Devices/Backup_Files/Shell/bin/"
alias zreload="source $ZDOTDIR"
alias python="/usr/local/opt/python/libexec/bin/python/"

# ------------------------- APPS -------------------------
alias preview="open -a Preview"
alias safari="open -a Safari"
alias photos="open -a Photos"
alias iina="open -a IINA"

# ------------------------- HTOP STUFF -------------------------
alias cpu="(which htop > /dev/null && htop --sort-key PERCENT_CPU) || top -o cpu"
alias ram="(which htop > /dev/null && htop --sort-key RES) || top -o rsize"

# ------------------------- GO -------------------------
alias gor="go run"

# ------------------------- HOMEBREW -------------------------
alias br="brew"
alias bru="brew update"                                                  
alias bri="brew install"                                                      
alias brri="brew reinstall"                                                   
alias "br??"="brew info"                                                       
alias bruu="brew update && brew upgrade"                                    
alias brupg="brew upgrade"                                                    
alias brc="brew cleanup"
alias brcpa="brew cleanup --prune all"
alias brrm="brew remove"
alias brrmz="brew remove --zap"                                               
alias brs="brew search"
alias brcu="brew cu -ay"

# ------------------------- HBLOCK -------------------------
alias adb=hblock
alias adboff="hblock -S none -D none"

