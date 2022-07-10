#!/bin/sh -

######################################################################
# This file provides some useful bash functions for convenient
# Function 1: print_bash_colors_0
# Function 2: print_bash_colors
######################################################################


__cReset='\033[0m'
__cPrefix='\033['
	
__code_style_normal="0"
__code_style_bold="1"
__code_style_faint="2"
__code_style_italics="3"
__code_style_underline="4"
#slist=($__code_style_normal $__code_style_bold $__code_style_faint $__code_style_italics $__code_style_underline)
#slist_str=("normal" "bold" "faint" "italics" "underline")
#snum=${#slist[@]}


__code_foreground="3"
__code_light_foreground="9"
__code_background="4"
__code_light_background="10"
#glist=($__code_foreground $__code_light_foreground $__code_background $__code_light_background)
#glist_str=("fore" "light_fore" "back" "light_back")
#gnum=${#glist[@]}

__color_black="0m"
__color_red="1m"
__color_green="2m"
__color_orange="3m"
__color_blue="4m"
__color_purple="5m"
__color_cyan="6m"
__color_gray="7m"
#clist=($__color_black $__color_red $__color_green $__color_orange $__color_blue $__color_purple $__color_cyan $__color_gray)
#clist_str=("black" "red" "green" "orange" "blue" "purple" "cyan" "gray")
#cnum=${#clist[@]}

### Print normal messages
function print_info() {
    scode=${__code_style_normal}
    gcode=${__code_foreground}
    ccode=${__color_green}
    colorcode="${__cPrefix}${scode};${gcode}${ccode}"
    msg="$*"
    echo -e "${colorcode}${msg}${__cReset}"
}

### Print warning messages
function print_warning() {
    scode=${__code_style_normal}
    gcode=${__code_foreground}
    ccode=${__color_orange}
    colorcode="${__cPrefix}${scode};${gcode}${ccode}"
    msg="$*"
    echo -e "${colorcode}${msg}${__cReset}"
}

### Print error messages
function print_error() {
    scode=${__code_style_normal}
    gcode=${__code_foreground}
    ccode=${__color_red}
    colorcode="${__cPrefix}${scode};${gcode}${ccode}"
    msg="$*"
    echo -e "${colorcode}${msg}${__cReset}"
}

function __test_print_color_strings() {
    print_info "Hello, world"
    print_warning "Hello, world"
    print_error "Hello, world"
}

#__test_print_color_strings
