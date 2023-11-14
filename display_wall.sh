#! /bin/bash

userId=$1

if [ -d $userId ]; then
    echo "start of file"
    cat "$userId"/wall.txt
    echo "end of file"
else
    echo nok: user "$userId" does not exist
fi    
