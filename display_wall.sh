#! /bin/bash

userId=$1

if [ -d $userId ]; then
    declare displayString
    while read line;
    do
        displayString+="$line"
        displayString+="\n"
    done < ""$userId"/wall.txt"
    printf "$displayString"
else
    echo nok: user "$userId" does not exist
fi    
