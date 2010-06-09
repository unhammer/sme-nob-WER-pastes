#!/bin/bash

if [ "$#" -eq 1 ]; then 
    git show "$1":current-paste > old.tmp
    cp current-paste new.tmp
elif [ "$#" -eq 2 ]; then 
    git show "$1":current-paste > old.tmp
    git show "$2":current-paste > new.tmp
else
    echo "Usage: sh extract.sh old-commit [new-commit]"
    echo "Arguments are commit names understandable by git. If new-commit is not given, HEAD is used."
    exit 1
fi
