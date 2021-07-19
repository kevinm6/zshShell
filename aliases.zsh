#############################################################
#------------------------  ALIAS  --------------------------#
#############################################################


# ------------------------- SUFFIX ALIASES -------------------------
alias -s json=subl
alias -s txt=vim
alias -s pdf=preview

# ------------------------- VARIOUS TERMINAL -------------------------
alias l="ls -al"
alias c="clear"
alias ".."="cd .."
alias "..,.."="cd ../.."
alias :q="exit"
alias hh="history"
alias oa="open -a"
alias o="open"
alias oe="open -e"
alias ka="killall"
alias rmh="rm ~/.config/.zsh/.zsh_history"
alias zpath="~/.config/.zsh/"
alias vipath="~/.config/vim/"
alias cppath="echo `pwd` | pbcopy"

# ------------------------- HTOP STUFF -------------------------
alias cpu="(which htop > /dev/null && htop --sort-key PERCENT_CPU) || top -o cpu"
alias ram="(which htop > /dev/null && htop --sort-key RES) || top -o rsize"

# ------------------------- GIT -------------------------
alias gi="git init"
alias gs="git status"
alias gf="git fetch"
alias gp="git push"
alias gb="git branch"
alias grm="git rm"
alias gpl="git pull"
alias gsw="git switch" 
alias gc="git commit -m" # git commit w/ message
alias ga="git add"
alias gaa="git add ." # git add all changes in current dir
alias gb="git branch"
alias gck="git checkout"
alias gdf="git diff"
alias gdt="git difftool"

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

