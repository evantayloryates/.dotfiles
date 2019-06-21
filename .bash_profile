GLOBAL_DIR

#################
## ANSI COLORS ##
#################

# Black        0;30     Dark Gray     1;30
# Red          0;31     Light Red     1;31
# Green        0;32     Light Green   1;32
# Brown/Orange 0;33     Yellow        1;33
# Blue         0;34     Light Blue    1;34
# Purple       0;35     Light Purple  1;35
# Cyan         0;36     Light Cyan    1;36
# Light Gray   0;37     White         1;37

export CLICOLOR=1

LGRAY='\033[0;37m'
NC='\033[0m' # No Color

# TYPE: file_config
SCRIPT_DIR=/Users/etay/src/scripts 

# Source application openers
source /Users/etay/.bash/.openers

###########
## UTILS ##
###########

# TYPE: alias
# DESC: allow use of 'sudo with aliases'
alias sd="sudo "

# TYPE: alias
# DESC: ensures the default 'python' command is v3.6+
function py3 {
	if [ $# -eq 0 ] 
	then
    	python3.6
	else
		echo "args"
		python3.6 "$@"
	fi
}

# TYPE: alias
# DESC: ensures the default 'python' command is v3.6+
function py2 {
	if [ $# -eq 0 ] 
	then
    	python2.7
	else
		python2.7 "$@"
	fi
}

# TYPE: alias
# DESC: source the .bash_profile
alias src="source ~/.bash_profile"

# TYPE: alias
# DESC: improve default 'ls' command
alias tls="cl;ls -alhtr"

# TYPE: alias
# DESC: ls sorted by name
alias ls="cl;ls -alhG"

command1()
{
    if [ "$BASH_COMMAND" != command2 ]
    then
        command_flag=1
    fi
    return 0
}
trap command1 debug
command2()
{
    if [ ! "$command_flag" ]
    then
        ls                            # Put whatever command(s) you want here.
    fi
    command_flag=
}
PROMPT_COMMAND=command2

# TYPE: alias
# DESC: list just directories
alias ld="ls -dl .*/ */"

# TYPE: alias
# DESC: list just files
alias lf="ls -p | grep -v /"

# TYPE: alias
# DESC: short hand for going up a directory
alias cd..="cd .."

# TYPE: function
# DESC: "change directory verbose"
function cs () {
    cd "$@" && ls
}


##################
## FILE OPENERS ##
##################

# TYPE: alias
# DESC: open hamerspoon config file
alias ham="open ~/.hammerspoon/init.lua"

# TYPE: alias
# DESC: open app openers script
alias openers="open ~/.bash/.openers"

# TYPE: alias
# DESC: open tasks file
alias work="open ~/src/working.txt"

# TYPE: alias
# DESC: open tasks file
alias imp="open ~/src/important.txt"

# TYPE: alias
# DESC: open projects directory
alias proj="cd ~/src/projects;clear;ls;"

# TYPE: alias
# DESC: open keys file
alias keys="open ~/.keys"

# TYPE: alias
# DESC: open vim config file
alias vimrc="open ~/.vimrc"

# TYPE: alias
# DESC: quickly open python tools directory in Sublime Text 3
alias tools="subl /Users/etay/src/python-tools"

# TYPE: alias
# DESC: open .bash_profile
alias pro="open ~/.bash_profile"

# TYPE: alias
# DESC: open .bash_profile
alias pyrc="open ~/.pythonrc"

# TYPE: function
# DESC: Make a new file and open
function new {
  if [[ $# -eq 0 ]] ; then
    subl -n
   else
    touch $1
    open $1
   fi
}

#############
## ANGULAR ##
#############

# TYPE: alias
# DESC: start up mongo shell for tutorial-project
alias mon="mongo "mongodb+srv://mean-tutorial-cluster-7q3tf.mongodb.net/test" --username evan"

# TYPE: alias
# DESC: build api-nasa-gov angular app and push to gh-pages branch
alias run-pgs="sudo rm -rf '/Users/etay/src/projects/api-nasa-gov/dist' ; sudo ng build ; sudo npm run ng -- build --base-href /api-nasa-gov/ ; sudo ng build --prod --base-href https://evantayloryates.github.io/api-nasa-gov/ ; sudo ngh --dir=dist/api-nasa-gov/"

# TYPE: function
# DESC: generate new mod
# ARG_1: desired name of mod
function mod {
	if [[ $# -ne 1 ]] ; then 
    	echo "illegal number of parameters"
      else
      	ng g module $1 --routing=true --module=app
	fi
}

#####################
## SSH CONNECTIONS ##
#####################

# TYPE: alias
# DESC: Connect to AWS E2 instance where minecraft server is running
alias e2="ssh ec2-user@13.57.219.161 -i ~/me/.keys/minecraft.pem"

#################
## APP OPENERS ##
#################

# TYPE: alias
# DESC: Opens new Chrome window
alias chr="open -n /Applications/Google\ Chrome.app"

# TYPE: function
# DESC: Start new Minecraft client
function min {
	if [ "$1" = "c" ]; then
  		open /Applications/Minecraft.app
  fi
	if [ "$1" = "s" ]; then
		/Users/etay/me/minecraft/start.command
	fi
  if [ "$1" = "ip" ]; then
    echo "54.153.43.222 "
  fi
	
}
# TYPE: alias
# DESC: Start new Minecraft client
alias mins="open /Applications/Minecraft.app"

####################
## TERMINAL TOOLS ##
####################

# TYPE: alias
# DESC: clear terminal
alias cl="osascript -e 'tell application \"System Events\" to keystroke \"k\" using command down'"

# TYPE: alias
# DESC: list all active aliases
alias aliases="python ${SCRIPT_DIR}/get_aliases.py"

# TYPE: alias
# DESC: show recently used commands
alias cmds="python ${SCRIPT_DIR}/get_top_commands.py"

# TYPE: alias
# DESC: list directories in the current PATH
alias path="python ${SCRIPT_DIR}/get_path.py"

# TYPE: alias
# DESC: quick jump to Desktop directory
alias d="cd ~/Desktop"

# TYPE: alias
# DESC: quick jump to src directory with content list
alias h="cd ~;clear"

# TYPE: alias
# DESC: quick jump to src directory with content list
alias s="cd ~/src;clear;ls"

# TYPE: alias
# DESC: opens the current directory in Finder
alias o="open ."

# TYPE: alias
# DESC: prints out the current environment variables alphabetically
alias env="env | sort"

# TYPE: alias
# DESC: opens the System Peferences application
alias set="open -a /Applications/System\ Preferences.app"

# TYPE: alias
# DESC: hide hidden files in Finder
alias hide="defaults write com.apple.finder AppleShowAllFiles FALSE  && killall Finder"

# TYPE: alias
# DESC: show hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"

# TYPE: alias
# DESC: follow cpu activity
alias cpu="top -F -R -o cpu"

# TYPE: alias
# DESC: activate screensaver
alias lock="/System/Library/CoreServices/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine"

# TYPE: alias
# DESC: open applications directory in Finder
alias app="open /Applications"

# TYPE: export
# DESC: If this variable is set and has a non-null value, then it will be executed
#       just before the PS1 variable
# export PROMPTCOMMAND='pwd'
#out=$(pwd); printf "$LGRAY$out$NC\n"'

# TYPE: export
# DESC: sets the main terminal prompt displayed on every line
export PS1='\[`tput setaf 014`\]\h\[`tput setaf 255`\]:$PWD\n\[`tput sgr0`\]\$ '

# TYPE: export
# DESC: sets the continuation string for multi-line commands
export PS2='--> '

# TYPE: export
# DESC: sets the default file editor
export EDITOR="/Applications/Sublime\ Text.app/Contents/MacOS/Sublime\ Text"

# TYPE: path_add
# DESC: adds Python 3.6 directory to the PATH. The original version
#       is saved in .bash_profile.pysave
PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.6/bin

# TYPE: path_add
# DESC: adds subl command to the active PATH
PATH=$PATH:/Applications/Sublime\ Text.app/Contents/SharedSupport/bin

export PATH

# TYPE: export
# DESC: add a python startup script
export PYTHONSTARTUP=/Users/etay/.pythonrc

# TYPE: export
# DESC: ensures that all terminals write to same history file
# export PROMPT_COMMAND="$PROMPT_COMMAND; echo 'hello'; history -a"

# TYPE: export
# DESC: automatically adds "-i" to python commands
export PYTHONINSPECT="False"

# TYPE: export
# DESC: Database prefix for wordpress website
export WP_PREFIX="3_jd8_"

# TYPE: export
# DESC: Used to detect if iTerm is active terminal
export TERM_PROGRAM="iTerm"

# TYPE: misc
# DESC: append to the history file, don't overwrite it
shopt -s histappend

# Clear terminal after sourcing
clear

