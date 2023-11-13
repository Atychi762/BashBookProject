#! /bin/bash

if [[$# -eq 0]]; then
	echo 'nok: no idetifier provided'

else
	for item in { $( ls -d ) }; 
	do
		
		if [ $item = "$1/" ]; then 
			echo "nok: user already exists"
			return 1
		else
			continue
		fi
	done
	mkdir $1
	echo 'ok: user created!'
 	> "$1"/wall.txt
  	> "$1"/friends.txt
fi



