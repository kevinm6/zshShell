export PATH="/usr/local/bin:/usr/bin:$PATH"

function Safari {                                                               
# Will open a New Safari window with argument 1.                              
osascript <<EOD                                                                 
	tell application "Safari" to make new document with properties {URL:"$1"}
	return
EOD
}

function version(){
	appVersion=$(defaults read $1/Contents/Info.plist CFBundleShortVersionString)
	echo -e "\t↳  $(basename $1)  ->  \e[0;32m$appVersion\e[0m"
}

function zSource(){
    source ~/.config/.zsh/.zshrc
    zBackupToDrive ~/.config/.zsh/.zshrc
    echo "✔ .zshrc sourced."
}

function zEdit(){
    vi ~/.zshrc
	 source ~/.config/.zsh/.zshrc
    zBackupToDrive ~/.config/.zsh/.zshrc
    echo "✔ .zshrc edited and reloaded."
}

function zBackupToDrive(){
    cp -rf "$1" /Users/Kevin/Documents/\ Devices/File\ di\ Backup/Shell/
    echo "✔ $1 backed up to iCloud Drive."
}

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
