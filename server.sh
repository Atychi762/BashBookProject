#! /bin/bash

mkfifo server_pipe
while [ 0=0 ]
do 
    IFS=" " read -ra inpt_array < server_pipe 
    userId=${inpt_array[0]}

    case ${inpt_array[1]} in
        create)
            bash ./create.sh ${inpt_array[2]} > ""$userId"_pipe"
            ;;
        add)
            bash ./add_friend.sh "$inpt_array[2]" "$inpt_array[3]" > ""$userId"_pipe"
            ;;
        post)
            bash ./post_messages.sh "$inpt_array[2]" "$inpt_array[3]" "$inpt_array[4]" > ""$userId"_pipe"
            ;;
        display)
            bash ./display_wall.sh "$inpt_array[2]" > ""$userId"_pipe"
            ;;
        *)
            echo "Accepted Commands: create, add, post, display" > ""$userId"_pipe"
    esac
done
