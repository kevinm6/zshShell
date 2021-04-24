# K ZSH Configuration
set rtp+="$HOME/.config/vim$HOME/.config/vim/"

# Vim mode
bindkey -v
export KEYTIMEOUT=1

#emulate -LR zsh   <-- RESET TO DEFAULT ZSH OPTIONS

# Init
setopt PROMPT_SUBST

# Options
vi_mode_ins=${vi_mode_ins:-'%F{blue}ⓘ %f'}
vi_mode_cmd=${vi_mode_cmd:-'%F{yellow}⌘%f'}
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

#Edit line in vim w/ ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line 


#                                SHELL PROMPT
RPROMPT=$'$vi_mode_symbol  ⌚️ %F{white}%*%f'
PROMPT=$'\n  %#  %F{blue}%4~%f\n '

#ZSH
setopt auto_cd
setopt auto_menu
setopt auto_list
setopt correct
setopt vi

#history
HISTSIZE=2000
SAVEHIST=4000
HISTFILE=$HOME/.config/.zsh/.zsh_history
setopt hist_ignore_all_dups #remove older duplicate entries from history
setopt hist_reduce_blanks #remove superfluous blanks from history items
setopt share_history #share shell history between different shells
setopt append_history #add to main history instead of overwrite it
setopt hist_save_no_dups # do not save duplicates

#Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select #select completions with arrow keys

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

#terminal                                                                       
alias l='ls -al'                                                                
alias c='clear'                                                                 
alias :q='exit'                                                                 
alias rmh='rm ~/.config/.zsh/.zsh_history'                                                   
alias hh='history'                                                              
alias oa='open -a'                                                              
alias zreload='source ~/.config/.zsh/.zshrc'
alias '..'='cd ..'
alias o='open'
alias oe='open -e'
alias 'edz'='vim ~/.config/.zsh/.zshrc'
alias 'edvi'='vim ~/.config/vim/vimrc'

#brew                                                                           
alias brewu='brew update'                                                  
alias brewi='brew install'                                                      
alias brewri='brew reinstall'                                                   
alias brewii='brew info'                                                       
alias brewuu='brew update && brew upgrade'                                      
alias brewupg='brew upgrade'                                                    
alias brewcpa='brew cleanup --prune all'                                        
alias brewrmz='brew remove --zap'                                               
alias brews='brew search'

#hblock
alias hb=hblock
alias hboff='hblock -S none -D none'

#adblock                                                                        
# alias adb=adblock                                                               
# alias adbon='sudo adblock --force on'                                           
# alias adboff='sudo adblock off'                                                 
