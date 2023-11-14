#! /bin/bash

# check if the sender id exists
if [ -d $1 ]; then
	# check if the receiver id exists
	if [ -d $2 ]; then
		# if both ids exist check if they are friends
		if grep "$1" "$2"/friends.txt 1> /dev/null 2> /dev/null; then
			# if they are friends then add the message to the receivers wall file
			echo ""$1": "$3"" >> "$2"/wall.txt
			echo 'ok message posted'
		else 
			# if they are not friend print the error messgae
			echo "nok: "$1" is not a friend of "$2" "
		fi
	else 
		# eror sent when receiver id does not exist
		echo "nok: user "$2" does not exist"
	fi
else
	# error sent when sender id does not exist
	echo "nok: user "$1" does not exist"
fi