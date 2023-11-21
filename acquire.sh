#! /bin/bash

if [ -z "$1" ]; then
	echo "Usage $0 mutex-name" >&1
	exit 1
else
	currentDir=$( pwd )
	while ! ln "$currentDir$1" "$2"; do
		echo "fail"
		sleep 1
	done

	exit 0
fi
