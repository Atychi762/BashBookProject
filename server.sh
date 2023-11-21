#! /bin/bash

mkfifo server_pipe
while [ 0=0 ]
do 
    IFS=" " read -ra inpt_array < server_pipe 
    userId=${inpt_array[0]}
    echo ${inpt_array[@]}
    case ${inpt_array[1]} in
        create)
            sleep 10
            bash ./create.sh ${inpt_array[2]} > ""$userId"_pipe"
            ;;
        add)
            sleep 10
            bash ./add_friend.sh ${inpt_array[2]} ${inpt_array[3]} > ""$userId"_pipe"
            ;;
        post)
            counter=4
            declare -i counter
            postString=""
            spacechar=" "
            while [ $counter -le ${#inpt_array[@]} ]; do
                postString+=${inpt_array[counter]}
                postString+=$spacechar
                counter+=1
            done  
            sleep 10  
            bash ./post_messages.sh ${inpt_array[2]} ${inpt_array[3]} "$postString" > ""$userId"_pipe"
            ;;
        display)
            sleep 10
            > bash ./display_wall.sh ${inpt_array[2]} > ""$userId"_pipe"
            ;;
        *)
            echo "Accepted Commands: create, add, post, display" > ""$userId"_pipe"
    esac
done
