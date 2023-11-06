#! /bin/bash

if [[$# -eq 0]]; then
	echo 'nok: no idetifier provided'

elif [[ls -d | == $1]]; then
	echo 'nok: user already exists'

else
	mkdir $1
	echo 'ok: user created!'
 	> "$1"/wall.txt
  	> "$1"/friends.txt
fi



