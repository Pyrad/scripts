#!/bin/sh -

#   VERSTR_ALL=""
#   OS_INFO=""
#   if [[ -f /proc/version ]]; then
#   	VERSTR_ALL=`cat /proc/version`
#   	if [[ ${VERSTR_ALL:0:9} -eq "CYGWIN_NT" ]]; then
#   		### Check first 9 characters
#   		# echo "Current is Cygwin: $VERSTR_ALL"
#   		OS_INFO=${VERSTR_ALL:0:9}
#   	elif [[ ${VERSTR_ALL:0:10} -eq "MINGW64_NT" ]]; then
#   		### Check first 10 characters
#   		OS_INFO=${VERSTR_ALL:0:10}
#   	else
#   		OS_INFO="UNKWON"
#   	fi
#   fi
#   
#   ##############################################################################
#   ### In Cygwin terminal, set the command ls for its colors, otherwise something 
#   ### goes with its color display
#   ##################################################################################
#   if [[ $OS_INFO -eq "CYGWIN_NT" ]]; then
#   	eval "`dircolors -b /etc/DIR_COLORS`"
#   	alias ls='ls --color=auto'
#   fi
#   
#   
#   # Alias
#   alias cdwork='cd /d/GithubClone'
#   alias cdworkgitee='cd /d/Gitee'
#   alias g='git'
#   alias gs='git status'
#   alias gd='git difftool -t meld --no-prompt'
#   #alias gd='git difftool -t p4merge --no-prompt'

# If current is Chinese language, reset it to English
IS_CN_LANG=0
[[ ! -z $LANG ]] && [[ $LANG == "zh_CN.UTF-8" || $LANG == "zh_CN" ]] && IS_CN_LANG=1
[[ $IS_CN_LANG -eq 1 ]] && export LANG="C.UTF-8"
	
### Show colors for command ls
eval "`dircolors -b /etc/DIR_COLORS`"
alias ls='ls --color=auto'

### Setup for oh-my-posh
OHMYPOSH_DIR="/d/procs/ohMyPosh/"
OHMYPOSH_CMD="${OHMYPOSH_DIR}/bin/oh-my-posh"
THEME_DIR="${OHMYPOSH_DIR}/themes"
THEME_NAME="paradox.omp.json"
eval "$(${OHMYPOSH_CMD} --init --shell bash --config ${THEME_DIR}/${THEME_NAME})" 

### Force the cursor stop blinking
echo -e -n "\e[2 q"


