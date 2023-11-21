#! /bin/bash

userId=$1 #saving user id to a var 

if [ $# -eq 0 ]; then
	echo 'nok: no identifier provided' #if no arguments provided then print error

else
	if mkdir $userId 2>/dev/null; then #tries to create a directory, if it succeeds then it prints a positive message and creates 2 text files in the directory 
		echo 'ok: user created!' 
		> "$userId"/wall.txt
		> "$userId"/friends.txt
	else #if the program cannot create a directory, then it prints an error message
		echo "nok: user already exists"
	fi
	
fi