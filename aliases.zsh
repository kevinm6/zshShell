#############################################################
#------------------------  ALIAS  --------------------------#
#############################################################

# Version 27.10.21 - 10:00

# ------------------------- SUFFIX ALIASES -------------------------
alias -s json=$VISUAL
alias -s txt=$EDITOR
alias -s md=$EDITOR
alias -s pdf=preview
alias -s m3u8=iina

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
alias vi="nvim"
alias rmh="rm $ZDOTDIR/.zsh_history"
alias zpath="$ZDOTDIR"
alias vipath="$VIMDOTDIR"
alias nvipath="$NVIMDOTDIR"
alias cppath="echo $PWD | pbcopy"
alias binbackpath="$HOME/Documents/Devices/Backup_Files/Shell/bin/"
alias zreload="source ${$(ls $ZDOTDIR | grep -Ev "README.md")}"
alias python="/usr/local/opt/python/libexec/bin/python/"

# ------------------------- APPS -------------------------
alias preview="open -a Preview"
alias safari="open -a Safari"
alias photos="open -a Photos"
alias iina="open -a IINA"

# ------------------------- HTOP STUFF -------------------------
alias cpu="(which htop > /dev/null && htop --sort-key PERCENT_CPU) || top -o cpu"
alias ram="(which htop > /dev/null && htop --sort-key PERCENT_MEM) || top -o rsize"

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
alias brrm="brew remove"
alias brrmz="brew remove --zap"                                               
alias brs="brew search"
alias brcu="brew cu -ay"

# ------------------------- HBLOCK -------------------------
alias adb=hblock
alias adboff="hblock -S none -D none"

