#!/usr/bin/env bash

# Clones git repository and checkout given branch
# Arguments:
#   $1  git repository
#   $2  target destination
#   $3  git branch  (if empty then master)

eval 'RECENT_PATH=$PWD'

if [ -z "$3" ]; then
    BRANCH='master'
else
    eval 'BRANCH=$3'

fi

git clone $1 $2
cd $2
git checkout $BRANCH
cd $RECENT_PATH

unset RECENT_PATH
unset BRANCH
