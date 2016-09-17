#!/bin/sh -

echo $PATH > ~/.path.bak
date -d now >> ~/.path.bak
arr=( $(echo $PATH | awk -F ':' '{ for(i=0; i++ < NF; ) { print $i } }') )
arr_length=${#arr[@]}
echo "$arr_length element in total in orignal PATH var"

arr=($(awk -vRS=' ' '!a[$1]++' <<< ${arr[@]}))

arr_length=${#arr[@]}
echo "$arr_length element in total in orignal PATH var after unique"

newpath=""
for var in ${arr[@]};
do
    #echo $var
    newpath="$newpath:$var"
done
newpath=${newpath#?}

echo -n "PATH env after unique:  "
echo $newpath

#export PATH="$newpath"
