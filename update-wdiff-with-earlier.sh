#!/bin/bash

WER=/l/s/WER
echo "Path to the WER directory in apertium-sme-nob: ${WER}";


PASTES=$(cd $(dirname $0) && pwd)


cd ${PASTES}

if [ "$#" -eq 0 ]; then
    # HEAD^1 might be a change that didn't affect the file current-paste
    LAST=$(git log --first-parent -2 --pretty=%H -- current-paste | tail -n1)
    ./extract.sh ${LAST} && ${WER}/wdiff-to-html.sh old.tmp new.tmp > wdiff.html
elif [ "$#" -eq 1 ]; then
    ./extract.sh "$1" && ${WER}/wdiff-to-html.sh old.tmp new.tmp > wdiff.html
else
    echo "Usage: sh wdiff-to-html.sh [commit]"; 
    echo "where, by default, commit is the last one changing current-paste,";
    echo "otherwise a commit name understandable by git";
    exit 1; 
fi
