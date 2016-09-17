#!/bin/sh -

### Used for github commands

FILENAME="XXX.py"
git status
git branch
git add $FILENAME
git commit -m "Add file for first time"
git push -u origin master
