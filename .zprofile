export PATH="/usr/local/bin:/usr/bin:$PATH"

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

# Source zsh config
function zSource(){
    source ~/.config/.zsh/.zshrc
    zBackupToDrive ~/.config/.zsh/.zshrc
    echo "✔ .zshrc sourced."
}

# Edit zShell
function zEdit(){
    vi ~/.zshrc
	 source ~/.config/.zsh/.zshrc
    zBackupToDrive ~/.config/.zsh/.zshrc
    echo "✔ .zshrc edited and reloaded."
}

# Backup to iCloud Drive
function zBackupToDrive(){
    cp -rf "$1" /Users/Kevin/Documents/\ Devices/File\ di\ Backup/Shell/
    echo "✔ $1 backed up to iCloud Drive."
}

# Git add current dir changes
# then commit with the given message
# and then push to remote
function gacap(){
	git status
	git add .
	echo -en "\n\033[0;33mCommit message: \033[0m \033[0;31m" && read msg
	echo -e "\033[0m"
	git commit -m "$msg"
	echo
	git push
	echo
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
