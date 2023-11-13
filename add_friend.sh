#! /bin/bash


# check if the first id exists
if [ -d $1 ]; then
	# check if the second id exists
	if [ -d $2 ]; then
		# if both ids exist check if they are already friends
		if ! grep "$2" "$1"/friends.txt 2> /dev/null; then
			# if they are not friends then add the second user id to the first users friend file
			echo "$2" >> $1/friends.txt
			echo 'ok friend added'
		fi
	else 
		# eror sent when user 2 does not exist
		echo "nok: user "$2" does not exist"
	fi
else
	# error sent when user 1 does not exist
	echo "nok: user "$1" does not exist"
fi
