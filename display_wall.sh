#! /bin/bash

userId=$1

if [ -d $userId ]; then
    {
        cat "$userId"/wall.txt
    }
else
    echo nok: user "$userId" does not exist
fi    
