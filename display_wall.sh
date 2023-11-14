#! /bin/bash

if [ -d $1 ]; then
    echo "start of file"
    cat "$1"/wall.txt
    echo "end of file"
else
    echo nok: user "$1" does not exist
fi    
