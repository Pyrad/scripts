#!/bin/sh -

declare -A arr=("a" "b" "c")

iname="a"
[[ -n ${arr[$iname]} ]] && echo "\"$iname\" is in arr"

iname="k"
[[ ! -n ${arr[$iname]} ]] && echo "\"$iname\" is NOT in arr"

