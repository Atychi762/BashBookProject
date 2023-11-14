#! /bin/bash

userId=$1

if [ $# -eq 0 ]; then
	echo 'nok: no identifier provided'

else
	if mkdir $userId 2>/dev/null; then
		echo 'ok: user created!' 
		> "$userId"/wall.txt
		> "$userId"/friends.txt
	else
		echo "nok: user already exists"
	fi
	
fi