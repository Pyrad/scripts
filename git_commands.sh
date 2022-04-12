#!/bin/sh -

### Used for github commands

FILENAME="XXX.py"
git status
git branch
# FILE_NAME could be a file or a directory
git add $FILE_NAME # or 'git add *'
git commit -m "Add file for first time"
# Or use '-a' option to add comments in the prompt-up
git commit -a
git push -u origin master

### connect to a github repo
git remote add origin git@github.com:Pyrad/others.git

### Clone a github repo
git clone git@github.com:Pyrad/scripts.git

### Download changes from remote
git pull origin master

### Remove a file
# FILE_NAME could be a file or a directory
git rm $FILE_NAME
git commit -m "<Removed_A_File>"

### General steps
echo "# c_cpp_notes" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:Pyrad/<REPO_NAME>.git
git push -u origin master ###Before this you should create repo <REPO_NAME> first in github manually via website

### Pull from origin
git pull origin master # Equals to 'fetch + merge'
# After pulled, use 'git status -uno' to check if there's any conflict
# If there is, modify the conflicted files and then commit

### Remove untracked files/dirs in a specified path
git clean -f <path>
### Remove untracked files/dirs in current path
git clean -df
### Tells which files will be removed, just give the information but not remove indeed
git clean -n


### After a new repo has been created on Github page, and it is cloned to a local directory
### when to check in for the first time, the following message might show
######################################################
#  Pyrad@SSEA MINGW64 /d/GithubClone/HomePageMaker (master)
#  $ git status
#  On branch master
#  Your branch is based on 'origin/master', but the upstream is gone.
#    (use "git branch --unset-upstream" to fixup)
######################################################
### so execute the following command to reset
git branch --unset-upstream
### And then push it for the 1st time to the remote repository
git push --set-upstream origin master










