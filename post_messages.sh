#! /bin/bash

# adding the arguments to variables for better readability
sender=$1
receiver=$2
message=$3

# check if the sender id exists
if [ -d $sender ]; then
	# check if the receiver id exists
	if [ -d $2 ]; then
		# if both ids exist check if they are friends
		if grep "$sender" "$receiver"/friends.txt 1> /dev/null 2> /dev/null; then
			# if they are friends then add the message to the receivers wall file
			echo ""$sender": "$message"" >> "$receiver"/wall.txt
			echo 'ok message posted'
		else 
			# if they are not friend print the error messgae
			echo "nok: "$sender" is not a friend of "$receiver" "
		fi
	else 
		# eror sent when receiver id does not exist
		echo "nok: user "$receiver" does not exist"
	fi
else
	# error sent when sender id does not exist
	echo "nok: user "$sender" does not exist"
fi