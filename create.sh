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
	if mkdir $1 > /dev/null; then
		if [ $? == 0 ]; then 
			echo 'ok: user created!' 
		fi
 		> "$1"/wall.txt
  		> "$1"/friends.txt
	fi

fi