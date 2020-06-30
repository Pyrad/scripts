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

### Create a new branch and switch to that branch
git checkout -b <NEW_BRANCH_NAME>
### Create a new branch and DON'T switch to that branch
git branch <NEW_BRANCH_NAME>
### Switch to another branch
git checkout <OTHER_BRANCH_NAME>

### Create a new branch in local and then push it to the remote (GitHub) and then track it
# 1. Create a new branch in local
git branch <NEW_BRANCH_NAME>
# 2. Get the remote repo name
git remote
# 3. Push the new branch to remote repo
git push <REMOTE_REPO_NAME> <NEW_BRANCH_NAME>
# Usually remote repo name is 'origin'
git push origin <NEW_BRANCH_NAME>
# 4. Connect this new local branch with the new branch just pushed to the remote repo
git branch --set-upstream-to=origin/<NEW_BRANCH_NAME>
# 5. After that, modify code and push as usaul
git add -A
git commit -m "XXXXX"
git push (or use git push origin <NEW_BRANCH_NAME>)

