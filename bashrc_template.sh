# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

## Add by cailong at Jan. 3rd, 2020 for python2 (self-compiled)
export LD_LIBRARY_PATH="/home/pyrad/procs/python27/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="/home/pyrad/procs/python38/lib:$LD_LIBRARY_PATH"

### In order to search for boost shared libraries
export LD_LIBRARY_PATH="/home/pyrad/procs/boost_1_72_0/lib:$LD_LIBRARY_PATH"

export LDFLAGS="-L/home/pyrad/procs/ncurses6.1/lib"
export PATH="$HOME/procs/python38/bin:$PATH"

export PYRAD_VIM_HOME="$HOME/procs/vim82"
export PATH="$PYRAD_VIM_HOME/bin:$PATH"

if [[ -z "$PYTHONUSERBASE" ]]; then
    export PYTHONUSERBASE=/home/pyrad/procs/python38pkgs
fi

alias v='$PYRAD_VIM_HOME/bin/gvim'

BLUE_V='\[\033[38;5;39m\]'
GREEN_V='\[\033[38;5;76m\]'
RESET_V='\[$(tput sgr0)\]'
export PS1="[${BLUE_V}\u${RESET_V}@${BLUE_V}\h${RESET_V} ${GREEN_V}\W${RESET_V}]\$ "
