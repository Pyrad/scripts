#!/bin/sh -

### Set this var to 1 to display some debug messages
DEBUG_FLAG=0
#DEBUG_FLAG=1

### If not running interactively, don't do anything
[[ $DEBUG_FLAG -eq 1 ]] && [[ "$-" != *i* ]] && echo "Not interactive shell, return"
[[ "$-" != *i* ]] && return


################################################################################
# After mingw64/mingw-w64-x86_64-meld3 is installed, the following messages
# come up, thus set XDG_DATA_DIRS and XDG_DATA_HOME
################################################################################
# Note that 'D:/procs/msys64/mingw64/share' is not in the search path
# set by the XDG_DATA_HOME and XDG_DATA_DIRS
# environment variables, so applications may not
# be able to find it until you set them. The
# directories currently searched are:
#
# - D:\procs\msys64\home\Pyrad\.local\share
# - D:\procs\msys64\mingw64\share\
# - D:\procs\msys64\usr\local\share\
# - D:\procs\msys64\usr\share\

if [[ -z "$XDG_DATA_HOME" ]]; then
      export XDG_DATA_HOME="/mingw64/share"
else
      export XDG_DATA_HOME="$XDG_DATA_HOME:/mingw64/share"
fi
if [[ -z "$XDG_DATA_DIRS" ]]; then
      export XDG_DATA_DIRS="/mingw64/share"
else
      export XDG_DATA_DIRS="$XDG_DATA_DIRS:/mingw64/share"
fi


### If current is Chinese language, reset it to English
IS_CN_LANG=0
[[ ! -z $LANG ]] && [[ $LANG == "zh_CN.UTF-8" || $LANG == "zh_CN" ]] && IS_CN_LANG=1
[[ $IS_CN_LANG -eq 1 ]] && export LANG="C.UTF-8"
if [[ $DEBUG_FLAG -eq 1 ]]; then
	if [[ $IS_CN_LANG -eq 1 ]]; then
		echo "Current is Chinese Language Env: $IS_CN_LANG"
		echo "Setting LANG to $LANG"
	else
		echo "Current Language Env: $LANG"
	fi
	
fi
	
### Show colors for command ls
eval "`dircolors -b /etc/DIR_COLORS`"
alias ls='ls --color=auto'
[[ $DEBUG_FLAG -eq 1 ]] && echo "Setting colors for command ls"

#####################################################################
### A function to choose OhMyPosh theme
### based on today is which day of the year
### Paramters
### 	This function accepts 2 arguments at most
### 	1st argument is the directory name of the OhMyPosh themes
### 	2nd argument is whether to use default theme name instead
### 	So if there are 2 argument, just use the default name and return
### Return
###		Return a list of 3 values
###		filename, its index and the file list length
#####################################################################
function choose_omp_theme() {
	DEFAULT_F="paradox.omp.json"
	[[ $# -eq 0 ]] && echo "$DEFAULT_F" && return
	OMP_THEME_DIR="$1"
	[[ ! -d $OMP_THEME_DIR ]] && echo "$DEFAULT_F 0 0" && return
	[[ $# -eq 2 ]] && echo "$DEFAULT_F 0 0" && return
	# The return value from find is a single string
	flist_string=`find $OMP_THEME_DIR -type f -name "*.json"`
	# Convert that string into an array
	flist=($flist_string)
	declare -i nday
	declare -i num
	declare -i flistlen
	flistlen=${#flist[@]}
	nday=`date +%j`
	num=`expr $nday % $flistlen`
	fname=`basename ${flist[$num]}`
	#Return a list of 3 values
	#filename, its index and the file list length
	echo "$fname $num $flistlen"
}
### Setup for oh-my-posh
# Set OMP_ON to Non-Empty string to turn it ON
# Set OMP_ON to empty string to turn it OFF
OMP_ON=""
if [[ ! -z $OMP_ON ]] && [[ ! -z $TERM_PROGRAM ]] && [[ $TERM_PROGRAM == "Tabby" ]] && [[ ! -z $OS ]] && [[ $OS == "Windows_NT" ]] && [[ ! -z $OSTYPE ]] && [[ $OSTYPE == "msys" ]]; then
	OHMYPOSH_DIR="/d/procs/ohMyPosh/"
	OHMYPOSH_CMD="${OHMYPOSH_DIR}/bin/oh-my-posh"
	THEME_DIR="${OHMYPOSH_DIR}/themes"
	chooseInfoStr=$(choose_omp_theme $THEME_DIR)
	clist=($chooseInfoStr)
	THEME_NAME_ABS="${THEME_DIR}/${clist[0]}"
	[[ -f $OHMYPOSH_CMD ]] && eval "$(${OHMYPOSH_CMD} --init --shell bash --config $THEME_NAME_ABS)"
	[[ $DEBUG_FLAG -eq 1 ]] && echo "Setting oh-my-posh prompt (theme name: ${clist[0]})"
else
	[[ $DEBUG_FLAG -eq 1 ]] && echo "Skipped setting oh-my-posh prompt"
fi

### Force the cursor stop blinking
if [[ $TERM_PROGRAM != "Tabby" ]]; then
	echo -e -n "\e[2 q"
	[[ $DEBUG_FLAG -eq 1 ]] && echo "Stop cursor blinking for Non-Tabby emulator"
else
	[[ $DEBUG_FLAG -eq 1 ]] && echo "Current is Tabby emulator, leave cursor blinking setting alone"
fi

### To specify headers and libs of cxx boost libraries
export BOOST_INC_HOME="/d/procs/boost_1_79_0"
export BOOST_LIB_HOME="/d/procs/boost_1_79_0/lib"
if [[ ! -d $BOOST_INC_HOME ]] || [[ ! -d $BOOST_LIB_HOME ]]; then
	echo "[WARNING] Invalid path for BOOST_INC_HOME or BOOST_INC_HOME"
	echo "[WARNING] BOOST_INC_HOME: $BOOST_INC_HOME"
	echo "[WARNING] BOOST_LIB_HOME: $BOOST_LIB_HOME"
else
	if [[ $DEBUG_FLAG -eq 1 ]]; then
		echo "Setting BOOST_INC_HOME: $BOOST_INC_HOME"
		echo "Setting BOOST_LIB_HOME: $BOOST_LIB_HOME"
	fi
fi

### which alias to a wrapper function
which () {
 (alias; declare -f) | /usr/bin/which --tty-only --read-alias --read-functions --show-tilde --show-dot $@
}
export -f which

### Split PATH env (equals to command "set")
function __check_path_env() {
    echo $PATH | awk -F: '{for (i=0;++i<NF;) print $i}'
}
alias check_path='__check_path_env'

### Alias
MeldPath='/d/procs/Meld'
export PATH="$PATH:$MeldPath"
alias cdwork='cd /d/GithubClone'
alias cdworkgitee='cd /d/Gitee'
alias g='git'
alias gs='git status'
alias gd='git difftool -t meld --no-prompt'
alias gp='git pull'
#alias gd='git difftool -t p4merge --no-prompt'
alias ll='ls -l'	# long list
alias la='ls -A'	# all but . and ..
alias l='ls -CF'	#
alias v='vim'
alias vi='vim'
alias cgdb='/home/Pyrad/procs/cgdb/bin/cgdb'


### Default editor
export -n EDITOR='vim'
export -n VISUAL='vim'
export -n GIT_EDITOR='vim'

######################################################
### In order to distinguish different host machines,
### introduce an environmental variable, thus it can
### be checked to decide which lib/path/tool/.. to use
### This is especially useful when building "cpp11"
### project
### Currently this variable will be defined as the following,
### Host machine
### 1.  Variable Name: DISTINGUISHED_NICKNAME
###    Variable Value: Asus_Win7_MSYS2
###      Host machine: MSYS2 on Windows 7, ASUS desktop
### 2.  Variable Name: DISTINGUISHED_NICKNAME
###    Variable Value: Asus_Win7_VBox_Ubuntu_20_04_LTS
###      Host machine: Ubuntu 20.04 LTS installed on VirtualBox, Windows 7, Asus desktop
### 3.  Variable Name: DISTINGUISHED_NICKNAME
###    Variable Value: Asus_Win7_VBox_OpenSUSE
###      Host machine: OpenSUSE installed on VirtualBox, Windows 7, Asus desktop
######################################################
export DISTINGUISHED_NICKNAME="Asus_Win7_MSYS2"
#export DISTINGUISHED_NICKNAME="Asus_Win7_VBox_Ubuntu_20_04_LTS"
#export DISTINGUISHED_NICKNAME="Asus_Win7_VBox_OpenSUSE"


