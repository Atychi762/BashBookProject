#! /bin/bash

if [ $# -eq 0 ]; then
	echo 'nok: no idetifier provided'

else
	if mkdir $1 2>/dev/null; then
		echo 'ok: user created!' 
		> "$1"/wall.txt
		> "$1"/friends.txt
	else
		echo "nok: user already exists"
	fi
	
fi