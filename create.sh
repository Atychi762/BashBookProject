#! /bin/bash

if [[$# -eq 0]]; then
	echo 'nok: no idetifier provided'

else
	for item in ${ls -d}; 
	do
		if [item -eq $1]; then 
			echo "Sorry username already taken. Please pick another username"
		else
			mkdir $1
			echo 'ok: user created!'
 			> "$1"/wall.txt
  			> "$1"/friends.txt
		fi
	done
fi



