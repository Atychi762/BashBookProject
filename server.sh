#! /bin/bash

while [ 0=0 ]
do 
    read inpt1 inpt2 inpt3
    case $1 in
        create)
            bash ./create.sh $2
            ;;
        add)
            bash ./add_friend.sh $2 $3
            ;;
        post)
            bash ./post_messages.sh $2 $3 $4 
            ;;
        display)
            bash ./display_wall.sh $2
            ;;
        *)
            echo "Accepted Commands: {create|add|post|display}"
            exit 1
    esac
done