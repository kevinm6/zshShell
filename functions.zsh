#############################################################
#----------------------- FUNCTIONS -------------------------#
#############################################################

## Version 28.09.21

## ----------------------  DO NOT DISTURB  -------------------------
# ON
dndOn() {
	defaults -currentHost write com.apple.notificationcenterui doNotDisturb -bool true
	killall "NotificationCenter"
	echo -e "\t\e[0;32m✔\e[0m Do Not Disturb enabled"
}
##

# OFF
dndOff() {
	defaults -currentHost write com.apple.notificationcenterui doNotDisturb -bool false
	killall "NotificationCenter"
	echo -e "\t\e[0;32m✔\e[0m Do Not Disturb disabled"
}
##

## ----------------------  macOS APPS  -------------------------

# open given files in QuickLook w/o errors
ql() {
	qlmanage -p $@ >> /dev/null 2>&1
}
##

# get version of a given app
version(){
	for ap in $@; do
		appVersion=$(defaults read /$ap/Contents/Info.plist CFBundleShortVersionString)
		echo -e "\t↳  $(basename $ap)  ->  \e[0;32m$appVersion\e[0m"
	done
}

##


## ----------------------  VOLUMES  -------------------------
lsv() {
	ls /Volumes/ | grep -Ev "KevinSSD 480Gb|KevinSSD support"
}

rmv() {
	if [ -z $@ ]; then
		ls /Volumes/ | grep -Ev "KevinSSD 480Gb|KevinSSD support|usb1_*|Cinema|Music"
	else
		for d in $@; do
			diskutil umount "$d"
		done
	fi
}


## END Volumes


## ----------------------  ZSH  -------------------------

edz() {
	cd ~/.config/.zsh/
	vi ~/.config/.zsh/.zshrc &&
		source ~/.config/.zsh/.zshrc
			echo -e "\t\e[0;32m✔\e[0m  Zsh Configuration updated and sourced"
		}

edzp() {
		cd ~/.config/.zsh/
		vi ~/.config/.zsh/.zprofile &&
			source ~/.config/.zsh/.zprofile
					echo -e "\t\e[0;32m✔\e[0m  Zsh Profile updated and sourced"
				}
## END Zsh Functions


## ---------------------- VIM -------------------------

edvi() {
	cd ~/.config/vim/
	vi ~/.config/vim/vimrc
	echo -e "\t\e[0;32m✔\e[0m Vim Configuration updated"
}
##


## ---------------------- NANO  -------------------------

ednano() {
	cd ~/.config/nano/
	vi ~/.config/nano/nanorc &&
		source ~/.config/nano/nanorc
			echo -e "\t\e[0;32m✔\e[0m Nano Configuration updated and sourced"
		}
##

## ---------------------- ADBLOCK  -------------------------
#AdBlock Functions (hBlock)
edadb() {
	sudo -E vi /etc/hblock/sources.list &&
		hblock
	}
##


## ----------------------  GIT  -------------------------
# git add files in dir and commit /w msg
gac() {
	if [[ -z $@ ]]
	then
		echo "⚠️  Error, No given files!"
		return
	fi
	git add ${@} &&
		msg=""
		echo -en "\n\e[0;33m    Commit message: \e[0m \e[0;31m" && read msg
		echo -e "\e[0m\n"
		git commit -m $msg ||
			echo "⚠️  Error "
}
##

# git init and start new repo
gsi() {
	dir=$(echo $PWD)
	vared -p "    Do you want to start a new repo here
    ↳ $dir (y/n)?: " -c answ	

	case $answ in
		"y"|"Y")
			echo "\tStarting. . . "
			git init
			vi -o README.md .gitignore
			echo "\n\t README and ignore files are created"
			vared -p "    Enter GitHub url of the repository: " -repoUrl
			git add .
			msg=""
			echo -en "\n\e[0;33m    Commit message: \e[0m \e[0;31m" && read msg
			echo -e "\e[0m\n"
			git commit -m $msg ||
			echo "⚠️  Error "
			git push -u origin main

		;;

		*)
			echo "\t Cancel. . . Exit"
		;;

	esac
	return

	if [[  $@ ]]
	then
		echo "⚠️  Error, No given files!"
		return
	fi
	git add ${@} &&
		msg=""
		echo -en "\n\e[0;33m    Commit message: \e[0m \e[0;31m" && read msg
		echo -e "\e[0m\n"
		git commit -m $msg ||
			echo "⚠️  Error "
}
##


## Git add current dir changes, commit and push
gacap(){
	echo -e "\e[0;32m\nGit Status\e[0m"
	git status
	git add .
	echo "— — — — — — — — — — — — — — — — — — — — — — — — — —\n"
	msg=""
	if [ -z $@ ]
	then
		echo -e "\e[0;32mCommit Changes\e[0m"
		echo -en "\n\e[0;33m    Commit message: \e[0m \e[0;31m" && read msg
		echo -e "\e[0m"
	else
		msg=$@
		echo -e "\e[0;32mCommit Changes\e[0m"
		echo -en "\n\e[0;33m    Commit message:\e[0m  \e[0;31m$msg\e[0m\n"
	fi
	git commit -m "$msg"
	echo "\n— — — — — — — — — — — — — — — — — — — — — — — — — —\n"
	echo -e "\e[0;32mPush Changes\033[0m"
	git push
	echo "— — — — — — — — — — — — — — — — — — — — — — — — — —\n"
	echo -e "\e[0;32mGit Status\e[0m"
	git status
}
##

## ---------------------- PROGRESS BAR -------------------------
progress-bar() {
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
##

