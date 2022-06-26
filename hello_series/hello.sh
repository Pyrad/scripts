#!/bin/sh -

# Check a directory
dname="objs"
if [[ -d ${dname} ]]; then
    echo "${dname} is a directory"
else
    echo "${dname} is NOT a directory"
fi

# Ways to check CentOS version
lsb_release -d
hostnamectl
rpm -qa centos-release
