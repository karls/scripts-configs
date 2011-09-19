if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
	startx
	logout
fi

alias aptitude='sudo aptitude'
alias suspend='sudo pm-suspend'
alias reboot='sudo reboot'
alias poweroff='sudo poweroff'
alias arduino='~/arduino/arduino'
alias ll='ls -l'
alias ..='cd ..'
alias there='back'
alias php='php5-cgi'

function android-create-project()
{
	android create project \
		--target 4 \
		--name $1 \
		--path $HOME/code/android/$2 \
		--activity $1 \
		--package com.example.$2

	echo -n "Go to project? "
	read answer
	case $answer in
		"y" | "yes" | "yep" ) cd $HOME/code/android/$2
		;;
		* ) echo "OK"
	esac
}
function mcd()
{
	mkdir $1 && cd $1;
}

function here()
{
	echo $(pwd) > $HOME/.pwd
}

function back()
{
cd $(cat $HOME/.pwd)
}

function cdh()
{
cd && here
}

function -()
{
	cd -
}


# Set up some colours
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
txt_l_gray='\e[1;30m' # Dark gray

# Set the window title in urxvt
#if [ $TERM = "rxvt-unicode" ]; then
#	PROMPT_COMMAND='echo -ne "\033]0;term: ${PWD}\007"'
#fi

# Nice, minimal prompt
# ~/path/to/something $
PS1="\[$txtgrn\]\w\[$txtred\] $\[$txtwht\] "

# Environment variables
export TZ='Europe/Tallinn'
#export TZ='Europe/London'
export EDITOR='/usr/bin/vim'
export BROWSER='/usr/bin/chromium-browser'
export PATH=$PATH:$HOME/bin:$HOME/bin/android-sdk-linux_x86/tools
export PATH=$PATH:$HOME/bin/android-sdk-linux_x86/platform-tools
export PATH=$PATH:/usr/sbin
export OOO_FORCE_DESKTOP=gnome
export PYTHONSTARTUP=~/.pythonrc
export SHET_HTTP_URL=http://18sg.net:8080/
export SHET_HOST=18sg.net
export JAVA_HOME=/usr/lib/jvm/java-6-sun-1.6.0.22
export HISTSIZE=20000
export CVSROOT=/home/karl/code
export INPUTRC=~/.inputrc
#. shet_complete
#. ~/code/Scripts/shelf
#. ~/bin/tbbvars.sh

