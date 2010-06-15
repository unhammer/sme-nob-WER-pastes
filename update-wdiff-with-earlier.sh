#!/bin/bash

PASTES=$(dirname $0)

cd ${PASTES}

if [ "$#" -eq 0 ]; then
    # HEAD^1 might be a change that didn't affect the file current-paste
    LAST=$(git whatchanged -n 2 --pretty=oneline current-paste | grep -v 'current-paste *$'| cut -d' ' -f1 | tail -n 1)
    ./extract.sh ${LAST} && ./wdiff-to-html.sh old.tmp new.tmp > wdiff.html
elif [ "$#" -eq 1 ]; then
    ./extract.sh "$1" && ./wdiff-to-html.sh old.tmp new.tmp > wdiff.html
else
    echo "Usage: sh wdiff-to-html.sh [commit]"; 
    echo "where, by default, commit is the last one changing current-paste,";
    echo "otherwise a commit name understandable by git";
    exit 1; 
fi
