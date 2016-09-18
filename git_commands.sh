#!/bin/sh -

### Used for github commands

FILENAME="XXX.py"
git status
git branch
git add $FILENAME
git commit -m "Add file for first time"
git push -u origin master

### Clone a github repo
git clone git@github.com:Pyrad/scripts.git

### Download changes from remote
git pull origin master
