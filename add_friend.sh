#! /bin/bash

# adding the arguments to variables for better readability
userId=$1
friend=$2

# check if the first id exists as a directory
if [ -d $id ]; then
	# check if the second id existss as a directory
	if [ -d $friend ]; then
		# if both ids exist check if they are already friends
		if ! grep "$friend" "$userId"/friends.txt 2> /dev/null; then
			# if they are not friends then add the second user id to the first users friend file
			echo "$friend" >> $userId/friends.txt
			echo 'ok friend added'
			# Note friendship is not mutual i.e. if user1 friends user2, user1 will not be in user2's friends file

		else
			# message sent when the users are already friends
			echo nok: users already friends
		fi
	else 
		# eror sent when user 2 does not exist
		echo "nok: user "$friend" does not exist"
	fi
else
	# error sent when user 1 does not exist
	echo "nok: user "$userId" does not exist"
fi
