# Get the directory where this script lives (not necessarily working directory)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# For python scripts used in .dotfiles repo
PYTHON_DIR=$THIS_DIR/python

# load user-specific constants
source $SCRIPT_DIR/.local_config

# source openers
source $SCRIPT_DIR/bash/.openers

# source aliases
source $SCRIPT_DIR/bash/.aliases

# source exports
source $SCRIPT_DIR/bash/.exports

# source functions
source $SCRIPT_DIR/bash/.functions


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


# TYPE: misc
# DESC: Entering an empty command 
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
        ls  # Put whatever command(s) you want here.
    fi
    command_flag=
}
PROMPT_COMMAND=command2


# TYPE: misc
# DESC: append to the history file, don't overwrite it
shopt -s histappend























