#! /bin/bash

userId=$1
friend=$2

# check if the first id exists
if [ -d $id ]; then
	# check if the second id exists
	if [ -d $friend ]; then
		# if both ids exist check if they are already friends
		if ! grep "$friend" "$userId"/friends.txt 2> /dev/null; then
			# if they are not friends then add the second user id to the first users friend file
			echo "$friend" >> $userId/friends.txt
			echo 'ok friend added'
		fi
	else 
		# eror sent when user 2 does not exist
		echo "nok: user "$friend" does not exist"
	fi
else
	# error sent when user 1 does not exist
	echo "nok: user "$userId" does not exist"
fi
