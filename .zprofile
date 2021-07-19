#############################################################
#----------------------  ZPROFILE  -------------------------#
#############################################################
export PATH="/usr/local/bin:/usr/bin:$PATH"


## ----------------------  DO NOT DISTURB  -------------------------
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
##

## ----------------------  macOS APPS  -------------------------

# open given files in Preview.app
function preview() {
	open -a Preview $@
}

# open given files in QuickLook w/o errors
function ql() {
	qlmanage -p $@ >> /dev/null 2>&1
}

# open given urls in Safari
function safari {
	open -a Safari $@
}


# get version of a given app
function version(){
	for ap in $@; do
		appVersion=$(defaults read /$ap/Contents/Info.plist CFBundleShortVersionString)
		echo -e "\t↳  $(basename $ap)  ->  \e[0;32m$appVersion\e[0m"
	done
}

# open and import image to Photos.app
function photos() {
	open -a Photos $@
}

##

## ----------------------  ZSH  -------------------------

function edz() {
	cd ~/.config/.zsh/
	vi ~/.config/.zsh/.zshrc &&
		source ~/.config/.zsh/.zshrc
			echo -e "\t\e[0;32m✔\e[0m  Zsh Configuration updated and sourced"
		}

	function edzp() {
		cd ~/.config/.zsh/
		vi ~/.config/.zsh/.zprofile &&
			source ~/.config/.zsh/.zprofile
					echo -e "\t\e[0;32m✔\e[0m  Zsh Profile updated and sourced"
				}
			## END Zsh Functions


## ---------------------- VIM -------------------------

function edvi() {
	cd ~/.config/vim/
	vi ~/.config/vim/vimrc
	echo -e "\t\e[0;32m✔\e[0m Vim Configuration updated"
}
##


## ---------------------- NANO  -------------------------

function ednano() {
	cd ~/.config/nano/
	vi ~/.config/nano/nanorc &&
		source ~/.config/nano/nanorc
			echo -e "\t\e[0;32m✔\e[0m Nano Configuration updated and sourced"
		}
	##

## ---------------------- ADBLOCK  -------------------------
#AdBlock Functions (hBlock)
function edadb() {
	sudo -E vi /etc/hblock/sources.list &&
		hblock
	}
##


## ----------------------  GIT  -------------------------

# git add all in dir and commit /w msg
function gac() {
	if [ -z $@ ]
	then
		echo "⚠️  Error, No given files!"
		return
	fi

	if !(git add $@)
		then
			return
	fi
			msg=""
			echo -en "\n\e[0;33m    Commit message: \e[0m \e[0;31m" && read msg
			echo -e "\e[0m\n"
			git commit -m $msg
}

# Git add current dir changes
# then commit with the given message
# and then push to remote
function gacap(){
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
##

