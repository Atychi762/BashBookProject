#! /bin/bash

if [ -z "$1" ]; then #if the first argument is empty
	echo "Usage: $0 mutex-name" >&1 #print error
	exit 1 #exit false
else
	currentDir=$( pwd ) #this gets the current working directory and saves it to a var. we did this because we kept running into errors when we tried to acquire the lock 
						# as it would not be able to find the lock file
	while ! ln "$currentDir$1" "$2"; do # while the program fails to create a link file sleep 1 second.
		sleep 1
	done
	# the while loop will exit once the program succsessfully creates the link file, therefore acquiring the lock.
	exit 0
fi
