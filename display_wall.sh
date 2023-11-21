#! /bin/bash

userId=$1 #saving user id to a var 

if [ -d $userId ]; then #if there is a directory with the provided id as its name

    declare displayString # declare a new string to hold the contents of the wall.txt file

    while read line; # this loops over each line in the wall.txt file
    do

        displayString+="$line" #it adds the line to the string
        displayString+="\n" #it then adds the \n to make sure that the output is formatted correctly

    done < ""$userId"/wall.txt"

    printf "$displayString" #once the whole file has been added to the string, we return the string to the server
else #if there is not a directory with that name then we print an error

    echo nok: user "$userId" does not exist #print error

fi    
