#!/bin/sh -

### Used for github commands

FILENAME="XXX.py"
git status
git branch
git add $FILENAME
git commit -m "Add file for first time"
git push -u origin master

### connect to a github repo
git remote add origin git@github.com:Pyrad/others.git

### Clone a github repo
git clone git@github.com:Pyrad/scripts.git

### Download changes from remote
git pull origin master


### General steps
echo "# c_cpp_notes" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:Pyrad/<REPO_NAME>.git
git push -u origin master ###Before this you should create repo <REPO_NAME> first in github manually via website
