# K ZSH Configuration
set rtp+="$HOME/.config/vim"

# Vim mode
bindkey -v
export KEYTIMEOUT=1

#emulate -LR zsh   <-- RESET TO DEFAULT ZSH OPTIONS

#                                SHELL PROMPT
# Init
setopt PROMPT_SUBST

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn

precmd() {
    vcs_info
} 
# Options
vi_mode_ins=${vi_mode_ins:-'%F{blue}-- insert --%f'}
vi_mode_cmd=${vi_mode_cmd:-'%F{yellow}-- command --%f'}
vi_mode_symbol="${vi_mode_ins}" #initialize mode

# on keymap change, define the mode and redraw prompt
zle-keymap-select() {
  if [ "${KEYMAP}" = 'vicmd' ]; then
    vi_mode_symbol="${vi_mode_cmd}"
  else
    vi_mode_symbol="${vi_mode_ins}"
  fi
  zle reset-prompt
}
zle -N zle-keymap-select

# reset to default mode at the end of line input reading
zle-line-finish() {
  vi_mode_symbol="${vi_mode_symbol}"
}
zle -N zle-line-finish

TRAPINT() {
  vi_mode_symbol="${vi_mode_ins}"
  return $(( 128 + $1 ))
}

RPROMPT=$'$vi_mode_symbol  ⌚️ %F{white}%*%f'
PROMPT=$'\n  %# %F{blue}%4~%f\t${vcs_info_msg_0_}\n '


# Edit line in vim w/ ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line 


# ZSH
setopt auto_cd
setopt auto_menu
setopt auto_list
setopt correct
setopt vi
setopt no_list_beep

# history
HISTSIZE=2000
SAVEHIST=4000
HISTFILE=$HOME/.config/.zsh/.zsh_history
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt share_history # share shell history between different shells
setopt append_history # add to main history instead of overwrite it
setopt hist_save_no_dups # do not save duplicates

# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select # select completions with arrow keys

if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
	autoload -Uz compinit
	compinit
fi


#                                 Plugins
plugins=(
	vim
	brew
	man
	osx
	python
	zsh-syntax-highlighting
	zsh-autosuggestions
)

#                                  Alias

# terminal
alias l='ls -al'                                                                
alias c='clear'                                                                 
alias '..'='cd ..'
alias :q='exit'                                                                 
alias hh='history'                                                              
alias oa='open -a'                                                              
alias o='open'
alias oe='open -e'
alias ka='killall'
alias rmh='rm ~/.config/.zsh/.zsh_history'                                                   
alias zreload='source ~/.config/.zsh/.zshrc'
alias edz='vim ~/.config/.zsh/.zshrc && source ~/.config/.zsh/.zshrc'
alias edvi='vim ~/.config/vim/vimrc'
alias ednano='vim ~/.config/nano/nanorc'
alias gs='git status'
alias gc='git commit'
alias gcm='git commit -m' # git commit w/ message
alias ga='git add'
alias gaa='git add .' # git add all changes in current dir
alias gb='git branch'
alias gac='git add . && git commit -m'
alias gp='git push'
alias gb='git branch'
alias gor='go run'

# homebrew
alias br='brew'
alias bru='brew update'                                                  
alias bri='brew install'                                                      
alias brri='brew reinstall'                                                   
alias 'br??'='brew info'                                                       
alias bruu='brew update && brew upgrade'                                    
alias brupg='brew upgrade'                                                    
alias brc='brew cleanup'
alias brcpa='brew cleanup --prune=all'
alias brrm='brew remove'
alias brrmz='brew remove --zap'                                               
alias brs='brew search'
alias brcu='brew cu -ay'

# hblock
alias adb=hblock
alias adboff='hblock -S none -D none'

# adblock                                                                        
# alias adb=adblock                                                               
# alias adbon='sudo adblock --force on'                                           
# alias adboff='sudo adblock off'                                                 
