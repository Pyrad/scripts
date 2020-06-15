#!/bin/sh -

# Check a directory
dname="objs"
if [[ -d ${dname} ]]; then
    echo "${dname} is a directory"
else
    echo "${dname} is NOT a directory"
fi
