#!/bin/sh -

#------------------------------------------------------
# Refer to web page
# https://www.cyberciti.biz/faq/bash-for-loop/
#------------------------------------------------------

echo "Current bash version ${BASH_VERSION}..."

echo "==== For loop exampel 1 ===="
for i in 1 2 3 4 5
do
	echo "Current var i = $i"
done

echo "==== For loop exampel 2 (need bash version > 3.0) ===="
for i in {1..5}
do
	echo "Current var i = $i"
done

echo "==== For loop exampel 3 (need bash version > 4.0) ===="
for i in {0..10..2}
do
	echo "Current var i = $i"
done

echo "==== For loop exampel 4 ===="
for i in $(seq 1 2 20)
do
	echo "Current var i = $i"
done

echo "==== For loop exampel 5 ===="
for (( c = 1; c <= 5; c++ ))
do 
	echo "Current var i = $i"
done


