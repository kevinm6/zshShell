export PATH="/usr/local/bin:/usr/bin:$PATH"

# Do Not Disturb

# ON
function dndOn() {
	defaults -currentHost write com.apple.notificationcenterui doNotDisturb -boolean true && 
	killall Notification Center
}

# OFF
function dndOff() {
	defaults -currentHost write com.apple.notificationcenterui doNotDisturb -boolean false && 
	killall Notification Center
}


# open new window with given url in Safari
function Safari {                                                               
# Will open a New Safari window with argument 1.                              
osascript <<EOD                                                                 
	tell application "Safari" to make new document with properties {URL:"$1"}
	return
EOD
}


# get version of app
function version(){
	appVersion=$(defaults read $1/Contents/Info.plist CFBundleShortVersionString)
	echo -e "\t↳  $(basename $1)  ->  \e[0;32m$appVersion\e[0m"
}


#							################ ZSH #################

# Zsh Configuration
function edz() {
	cd ~/.config/.zsh/
	vi ~/.config/.zsh/.zshrc &&
	source ~/.config/.zsh/.zshrc
	echo "\t✔ Zsh Configuration updated and sourced"
}

function edzp() {
	cd ~/.config/.zsh/
	vi ~/.config/.zsh/.zprofile &&
	source ~/.config/.zsh/.zprofile
	echo "\t✔ Zsh Profile updated and sourced"
}

function preview() {
	open -a Preview $1
}

function ql() {
	qlmanage -p $@ >> /dev/null 2>&1
}

#							################ VIM #################

# Vim Configuration
function edvim() {
	cd ~/.config/vim/
	vi ~/.config/vim/vimrc
	echo "\t✔ Vim Configuration updated"
}


#							################ NANO #################
# Nano Configuration 
function ednano() {
	cd ~/.config/nano/
	vi ~/.config/nano/nanorc &&
	source ~/.config/nano/nanorc
	echo "\t✔ Nano Configuration updated and sourced"
}


#							################ ADBLOCK (HBLOCK) #################
function edadb() {
	sudo -E vi /etc/hblock/sources.list &&
	hblock
}


#							################ GIT #################
# Git Configuration

# Git add current dir changes
# then commit with the given message
# and then push to remote
function gacap(){
	echo -e "\033[0;32m\nGit Status\033[0m"
	git status
	git add .
	echo "— — — — — — — — — — — — — — — — — — — — — — — — — —\n"
	echo -e "\033[0;32mCommit Changes\033[0m"
	echo -en "\n\033[0;33m    Commit message: \033[0m \033[0;31m" && read msg
	echo -e "\033[0m"
	git commit -m "$msg"
	echo "\n— — — — — — — — — — — — — — — — — — — — — — — — — —\n"
	echo -e "\033[0;32mPush Changes\033[0m"
	git push
	echo "— — — — — — — — — — — — — — — — — — — — — — — — — —\n"
	echo -e "\033[0;32mGit Status\033[0m"
	git status
}	

# Progress bar
function progress-bar() {
  local duration=${1}

    already_done() { for ((done=0; done<$elapsed; done++)); do printf "▇"; done }
    remaining() { for ((remain=$elapsed; remain<$duration; remain++)); do printf " "; done }
    percentage() { printf "| %s%%" $(( (($elapsed)*100)/($duration)*100/100 )); }
    clean_line() { printf "\r"; }

  for (( elapsed=1; elapsed<=$duration; elapsed++ )); do
      already_done; remaining; percentage
      sleep 1
      clean_line
  done
  clean_line
}
