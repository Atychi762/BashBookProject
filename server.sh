#! /bin/bash

mkfifo server_pipe
while [ 0=0 ]
do 
    read args < server_pipe | cut -d " " > argsfile.txt
    case "" in
        create)
            bash ./create.sh ""
            ;;
        add)
            bash ./add_friend.sh "" ""
            ;;
        post)
            bash ./post_messages.sh "" "" ""
            ;;
        display)
            bash ./display_wall.sh ""
            ;;
        *)
            echo "Accepted Commands: {create|add|post|display}"
            exit 1
    esac
done
