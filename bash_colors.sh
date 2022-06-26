#!/bin/sh -


######################################################################
# Function print_bash_colors_0 comes from others, keep it here as a 
# reminder. This original was located in another file, move it here
# to reduce file numbers. 2022-06-26  
######################################################################
# This program is free software. It comes without any warranty, to
# the extent permitted by applicable law. You can redistribute it
# and/or modify it under the terms of the Do What The Fuck You Want
# To Public License, Version 2, as published by Sam Hocevar. See
# http://sam.zoy.org/wtfpl/COPYING for more details.
function print_bash_colors_0() {
	for fgbg in 38 48 ; do # Foreground / Background
		for color in {0..255} ; do # Colors
			# Display the color
			printf "\e[${fgbg};5;%sm  %3s  \e[0m" $color $color
			# Display 6 colors per lines
			if [ $((($color + 1) % 6)) == 4 ] ; then
				echo # New line
			fi
		done
		echo # New line
	done
}

### Show different kinds of colors
function print_bash_colors() {
	cReset='\033[0m'
	cPrefix='\033['
	
	code_style_normal="0"
	code_style_bold="1"
	code_style_faint="2"
	code_style_italics="3"
	code_style_underline="4"
	slist=($code_style_normal $code_style_bold $code_style_faint \
			$code_style_italics $code_style_underline)
	slist_str=("normal" "bold" "faint" "italics" "underline")
	snum=${#slist[@]}
	
	
	code_foreground="3"
	code_light_foreground="9"
	code_background="4"
	code_light_background="10"
	glist=($code_foreground $code_light_foreground $code_background $code_light_background)
	glist_str=("fore" "light_fore" "back" "light_back")
	gnum=${#glist[@]}
	
	color_black="0m"
	color_red="1m"
	color_green="2m"
	color_orange="3m"
	color_blue="4m"
	color_purple="5m"
	color_cyan="6m"
	color_gray="7m"
	clist=($color_black $color_red $color_green $color_orange $color_blue \
			$color_purple $color_cyan $color_gray)
	clist_str=("black" "red" "green" "orange" "blue" "purple" "cyan" "gray")
	cnum=${#clist[@]}
	
	for (( s = 0; s < snum; s++ )) do
	for (( g = 0; g < gnum; g++ )) do
		for (( c = 0; c < cnum; c++ )) do
			sstr="${slist_str[$s]}"
			gstr="${glist_str[$g]}"
			cstr="${clist_str[$c]}"
	
			scode="${slist[$s]}"
			gcode="${glist[$g]}"
			ccode="${clist[$c]}"
	
			msg="${sstr} + ${gstr} + ${cstr}"
			ccode="${cPrefix}${scode};${gcode}${ccode}"
			echo -e "$s-$g-$c ${ccode}${msg} ${cReset}"
		done
	done
	done
}


### Call the function to display colors in bash
echo "--------------------------------------------------"
echo " Show colors by function print_bash_colors"
echo "--------------------------------------------------"
print_bash_colors

echo ""
echo "--------------------------------------------------"
echo " Show colors by function print_bash_colors_0"
echo "--------------------------------------------------"
print_bash_colors_0