#! /bin/bash

if [[$# -eq 0]]; then
	echo 'nok: no idetifier provided'

elif [[]]; then
	echo 'nok: user already exists'

else
	mkdir $1
	echo 'ok: user created!'
fi



