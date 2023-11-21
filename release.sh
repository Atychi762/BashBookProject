#! /bin/bash

# checking if the first argument is not null
if [ -z "$1" ]; then
		# If the argument is null then we sen the beloew message outlining the scripts usage
		echo "Usage: $0 mutex-name" >&1
		exit 1
else
		# if the argument is not null then we remove the file that was passed to the script
		rm "$1"
		exit 0
fi