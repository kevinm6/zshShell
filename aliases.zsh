#########################   ALIAS   #########################

#### Various Terminal ####
alias l="ls -al"                                                                
alias c="clear"                                                                 
alias ".."="cd .."
alias :q="exit"                                                                 
alias hh="history"                                                              
alias oa="open -a"                                                              
alias o="open"
alias oe="open -e"
alias ka="killall"
alias rmh="rm ~/.config/.zsh/.zsh_history"                                                   
alias ql="qlmanage -p"

#### Git #### 
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
alias gac="git add . && git commit -m"
alias gck="git checkout"

#### Go ####
alias gor="go run"

#### Homebrew ####
alias br="brew"
alias bru="brew update"                                                  
alias bri="brew install"                                                      
alias brri="brew reinstall"                                                   
alias "br??"="brew info"                                                       
alias bruu="brew update && brew upgrade"                                    
alias brupg="brew upgrade"                                                    
alias brc="brew cleanup"
alias brcpa="brew cleanup --prune=all"
alias brrm="brew remove"
alias brrmz="brew remove --zap"                                               
alias brs="brew search"
alias brcu="brew cu -ay"

#### Hblock ####
alias adb=hblock
alias adboff="hblock -S none -D none"

#### SUFFIX ALIASES ####
alias -s json=subl
alias -s txt=vim
