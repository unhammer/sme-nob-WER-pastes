#!/bin/bash

get_and_touch () {
    git show "$1":current-paste > "$2";
    D=$(git log --date=iso8601 "$1" -- current-paste | head -n3 | tail -n1 |\
sed 's/Date: *\(....\)-\(..\)-\(..\) \(..\):\(..\):\(..\).*/\1\2\3\4\5.\6/');
    touch -m -t "$D" "$2"
}

if [ "$#" -eq 1 ]; then
    get_and_touch "$1" old.tmp
    cp -p current-paste new.tmp
elif [ "$#" -eq 2 ]; then    
    get_and_touch "$1" old.tmp
    get_and_touch "$2" new.tmp
else
    echo "Usage: sh extract.sh old-commit [new-commit]"
    echo "Arguments are commit names understandable by git. If new-commit is not given, HEAD is used."
    exit 1
fi
