# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

test -s ~/.alias && . ~/.alias || true

if [[ -z $PATH ]]; then
    export PATH="/sbin"
else
    export PATH="$PATH:/sbin"
fi

BLUE_V='\[\033[38;5;39m\]'
GREEN_V='\[\033[38;5;76m\]'
RESET_V='\[$(tput sgr0)\]'
PS1="${BLUE_V}\u${RESET_V}@${BLUE_V}\h${RESET_V} ${GREEN_V}\W${RESET_V} > "


#alias v='/home/pyrad/procs/vim82/bin/gvim'
#alias vi='/home/pyrad/procs/vim82/bin/vim'
alias v='/usr/bin/gvim'
alias cgdb='/home/pyrad/procs/cgdb/bin/cgdb'
alias cdwork='cd /home/pyrad/worksrc/github/project_cig'
#which alias to a wrapper function
which () {
 (alias; declare -f) | /usr/bin/which --tty-only --read-alias --read-functions --show-tilde --show-dot $@
}
export -f which

export BOOST_INC_HOME="$HOME/procs/boost_1_73_0/include"
export BOOST_LIB_HOME="$HOME/procs/boost_1_73_0/lib"
export PATH="${BOOST_LIB_HOME}:$PATH"

# Split PATH env (equals to command "set")
function __check_path_env() {
    echo $PATH | awk -F: '{for (i=0;++i<NF;) print $i}'
}
alias check_path='__check_path_env'


if [ -z "$LD_LIBRARY_PATH" ]; then
    LD_LIBRARY_PATH="/home/pyrad/procs/boost_1_73_0/lib"
else
    LD_LIBRARY_PATH="/home/pyrad/procs/boost_1_73_0/lib:$LD_LIBRARY_PATH"
fi
LD_LIBRARY_PATH="/home/pyrad/procs/python38/lib64:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH
