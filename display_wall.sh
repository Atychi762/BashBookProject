#! /bin/bash

userId=$1

if [ -d $userId ]; then
    
    while read line;
    do
        echo "$line"    
    done < ""$userId"/wall.txt"
    
else
    echo nok: user "$userId" does not exist
fi    
