#-------------------------------------------
# File: functions.zsh
# Description: K ZSH Shell Functions
# Author: Kevin
# Source: https://github.com/kevinm6/zsh/
# Last Modified: 22/02/2022 - 10:01
#-------------------------------------------


# DO NOT DISTURB {

	## ON ##
	dndOn() {
		defaults -currentHost write com.apple.notificationcenterui doNotDisturb -bool true
		killall "NotificationCenter"
		echo -e "\t\e[32m✔\e[0m Do Not Disturb enabled"
	}

	## OFF ##
	dndOff() {
		defaults -currentHost write com.apple.notificationcenterui doNotDisturb -bool false
		killall "NotificationCenter"
		echo -e "\t\e[32m✔\e[0m Do Not Disturb disabled"
	}
# }

# macOS APPS & Plugins {
	# open given files in QuickLook w/o errors
	ql() {
		qlmanage -p $@ >> /dev/null 2>&1
	}
	##

	# get version of a given app
	version(){
		for ap in $@; do
			appVersion=$(defaults read /$ap/Contents/Info.plist CFBundleShortVersionString)
			echo -e "\t↳  $(basename $ap)  ->  \e[32m$appVersion\e[0m"
		done
	}
# }


# VOLUMES {
	lsv() {
		ls /Volumes/ | grep -Ev "KevinSSD 480Gb|KevinSSD support"
	}

	rmv() {
		if [ -z $@ ]; then
			ls /Volumes/ | grep -Ev "KevinSSD 480Gb|KevinSSD support|usb1_*|Cinema|Music"
		else
			for d in $@; do
				echo "   " && diskutil umount "$d"
			done
		fi
	}
# }


# ZSH {
	edz() {
		cd ~/.config/.zsh/
		nvim ~/.config/.zsh/.zshrc &&
			exec zsh
				echo -e "\t\e[32m✔\e[0m  Zsh Configuration updated and sourced"
	}

	edzp() {
			cd ~/.config/.zsh/
			nvim ~/.config/.zsh/.zprofile &&
				exec zsh
						echo -e "\t\e[32m✔\e[0m  Zsh Profile updated and sourced"
	}

	zreload() {
	 exec zsh
	}

	mkcd() {
		mkdir -p "$@" && cd "$_"
	}
# } 


# VIM {
	edvi() {	# edit vim config file
		cd $VIMDOTDIR
		vim ./vimrc && vim -c "source ./vimrc" -c "q" || echo "⚠️  Error editing file"
		echo -e "\t\e[32m✔\e[0m Vim Configuration updated"
	}
	
	ednvi() { # edit neovim config file
		cd $NVIMDOTDIR
		nvim ./init.lua && nvim -c "source ./init.lua" -c "q" || echo "⚠️  Error editing file"
		echo -e "\t\e[32m✔\e[0m NeoVim Configuration updated"
	}
# }


# NANO {
	ednano() {
		cd ~/.config/nano/
		vim ~/.config/nano/nanorc &&
			source ~/.config/nano/nanorc
				echo -e "\t\e[32m✔\e[0m Nano Configuration updated and sourced"
	}
# }

# ADBLOCK {
	edadb() { #AdBlock Functions (hBlock)
		sudo -E vim /etc/hblock/sources.list &&
			hblock
	}
#	}


# GIT {
	# git add files in dir and commit /w msg
	gac() {
		if [[ -z $@ ]]
		then
			echo "⚠️  Error, No given files!"
			return
		fi
		git add ${@} && msg="" || return

		echo -en "\n\e[33m    Commit message: \e[0m \e[91m" && read msg
		echo -e "\e[0m\n"
		git commit -m $msg ||
			echo "⚠️  Error "
	}

	## Git add current dir changes, commit and push
	gacap(){
		echo -e "\e[32m\nGit Status\e[0m"
		git status
		git add . &&
			echo "— — — — — — — — — — — — — — — — — — — — — — — — — —\n"
		msg=""
		if [ -z $@ ]
		then
			echo -e "\e[32mCommit Changes\e[0m"
			echo -en "\n\e[33m    Commit message: \e[0m \e[91m" && read msg
			echo -e "\e[0m"
		else
			msg=$@
			echo -e "\e[32mCommit Changes\e[0m"
			echo -en "\n\e[33m    Commit message:\e[0m  \e[91m$msg\e[0m\n"
		fi
		git commit -m "$msg"
		echo "\n— — — — — — — — — — — — — — — — — — — — — — — — — —\n"
		echo -e "\e[32mPush Changes\033[0m"
		git push
		echo "— — — — — — — — — — — — — — — — — — — — — — — — — —\n"
		echo -e "\e[32mGit Status\e[0m"
		git status
	}
# }

# PROGRESS BAR {
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
# }

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}
compctl -K _pip_completion pip
# pip zsh completion end

init_python_pipenv () {
   echo "Setting up pipenv environment"
   pipenv install --three
   echo "Installing ipython kernel"
   pipenv install --dev ipykernel
   # get name of environment and remove checksum for pretty name
   venv_name=$(basename -- $(pipenv --venv))
   venv_prettyname=$(echo $venv_name | cut -d '-' -f 1)
   echo "Adding ipython kernel to list of jupyter kernels"
   $(pipenv --py) -m ipykernel install --user --name $venv_name \
   --display-name "Python ($venv_prettyname)"
}
