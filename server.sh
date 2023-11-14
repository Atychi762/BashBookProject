#! /bin/bash

mkfifo server_pipe
while [ 0=0 ]
do 
    read -a argsArray < server_pipe
    case "$argsArray[0]" in
        create)
            bash ./create.sh "$argsArray[1]"
            ;;
        add)
            bash ./add_friend.sh "$argsArray[1]" "$argsArray[2]"
            ;;
        post)
            bash ./post_messages.sh "$argsArray[1]" "$argsArray[2]" "$argsArray[3]"
            ;;
        display)
            bash ./display_wall.sh "$argsArray[1]"
            ;;
        *)
            echo "Accepted Commands: {create|add|post|display}"
            exit 1
    esac
done
