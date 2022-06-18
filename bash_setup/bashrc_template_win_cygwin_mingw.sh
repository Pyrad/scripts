#!/bin/sh -

# Alias
alias cdwork='cd /d/GithubClone'
alias cdworkgitee='cd /d/Gitee'
alias g='git'
alias gs='git status'
alias gd='git difftool -t meld --no-prompt'
#alias gd='git difftool -t p4merge --no-prompt'

# powerline-daemon -q
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
# PY_PACKAGE_REPOSITORY_ROOT=/c/Python36/lib/site-packages
# #. {repository_root}/powerline/bindings/bash/powerline.sh
# . ${PY_PACKAGE_REPOSITORY_ROOT}/powerline/bindings/bash/powerline.sh

VERSTR_ALL=""
OS_INFO=""
if [[ -f /proc/version ]]; then
	VERSTR_ALL=`cat /proc/version`
	if [[ ${VERSTR_ALL:0:9} -eq "CYGWIN_NT" ]]; then
		### Check first 9 characters
		# echo "Current is Cygwin: $VERSTR_ALL"
		OS_INFO=${VERSTR_ALL:0:9}
	elif [[ ${VERSTR_ALL:0:10} -eq "MINGW64_NT" ]]; then
		### Check first 10 characters
		OS_INFO=${VERSTR_ALL:0:10}
	else
		OS_INFO="UNKWON"
	fi
fi

##############################################################################
### In Cygwin terminal, set the command ls for its colors, otherwise something 
### goes with its color display
##################################################################################
if [[ $OS_INFO -eq "CYGWIN_NT" ]]; then
	eval "`dircolors -b /etc/DIR_COLORS`"
	alias ls='ls --color=auto'
fi



### For oh-my-posh to load terminal prompt themes
### 2022-06-17
#eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/paradox.omp.json)" 
#eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/1_shell.omp.json)" 
eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/powerline.omp.json)" 
#eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/1_shell.omp.json)"

# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/agnoster.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/agnosterplus.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/aliens.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/amro.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/atomic.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/atomicBit.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/avit.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/blueish.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/blue-owl.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/bubbles.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/bubblesextra.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/bubblesline.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/capr4n.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/cert.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/cinnamon.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/clean-detailed.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/cloud-native-azure.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/craver.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/darkblood.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/default.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/devious-diamonds.omp.yaml)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/di4am0nd.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/dracula.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/easy-term.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/emodipt.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/festivetech.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/fish.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/free-ukraine.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/gmay.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/grandpa-style.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/half-life.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/honukai.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/hotstick.minimal.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/hunk.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/huvix.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/if_tea.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/iterm2.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/jandedobbeleer.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/jblab_2021.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/jonnychipz.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/jtracey93.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/jv_sitecorian.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/kali.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/lambda.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/lambdageneration.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/larserikfinholt.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/M365Princess.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/marcduiker.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/markbull.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/material.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/microverse-power.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/mojada.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/montys.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/mt.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/negligible.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/neko.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/night-owl.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/nordtron.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/nu4a.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/paradox.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/pararussel.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/patriksvensson.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/peru.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/pixelrobots.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/plague.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/powerlevel10k_classic.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/powerlevel10k_lean.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/powerlevel10k_modern.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/powerlevel10k_rainbow.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/powerline.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/probua.minimal.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/pure.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/remk.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/robbyrussel.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/rudolfs-dark.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/rudolfs-light.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/schema.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/slim.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/slimfat.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/smoothie.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/sonicboom_dark.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/sonicboom_light.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/sorin.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/space.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/spaceship.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/star.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/stelbent.minimal.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/takuya.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/thecyberden.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/the-unnamed.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/tiwahu.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/tokyo.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/tonybaloney.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/unicorn.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/velvet.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/wopian.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/xtoys.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/ys.omp.json)"
# eval "$(oh-my-posh --init --shell bash --config /d/procs/OhMyPosh/themes/zash.omp.json)"
