#! /bin/bash

# Creating the named pipe "server_pipe"
mkfifo server_pipe

# declaring a function to be called when ctrl+c is trapped
function removePipe(){
    # remove the server pipe 
    rm server_pipe
    # and exit with code 0
    exit 0
}
# trapping ctrl + c and running the remove pipe function
trap 'removePipe' SIGINT


# creating an infinite loop for the server to run
while [ 0=0 ]
do 
    # We read in the input from the server pipe to an array
    IFS=" " read -ra inpt_array < server_pipe 
    # we add the user id to the first index of the array
    userId=${inpt_array[0]}
    # the case statement checks for the users inputted command and executes the corresponding code 
    case ${inpt_array[1]} in
        create)
            # if the user inputted 'create' then we need to run the create script with the arguments the user provided
            # the users arguments will be stored in the array indexes 2, 3, and 4
            bash ./create.sh ${inpt_array[2]} > ""$userId"_pipe"
            ;;
        add)
            # if the user inputted add then run the add script again using the users arguments
            bash ./add_friend.sh ${inpt_array[2]} ${inpt_array[3]} > ""$userId"_pipe"
            ;;
        post)
        # if the user inputted post then we need to loop through the input array to get the message

            # initilize a counter as four since the users message will begin at index 4
            counter=4
            # we need to declare the counter as an integer so we can preform arithmitic on it later
            declare -i counter
            # declaring an oupt string 'postString' and a space character
            postString=""
            spacechar=" "
            # now we loop through the input array as long as counter is less than the length of the array
            while [ $counter -le ${#inpt_array[@]} ]; do
                # while the loop is iterating we add the word at index counter to postString
                postString+=${inpt_array[counter]}
                # Then we add a space after every word and increment the counter
                postString+=$spacechar
                counter+=1
            done
            # once the message has been made we run the post_messages script with postString as the message    
            bash ./post_messages.sh ${inpt_array[2]} ${inpt_array[3]} "$postString" > ""$userId"_pipe"
            ;;
        display)
            # if the user inputs 'display' we run the display_wall script with the entered arguments
            bash ./display_wall.sh ${inpt_array[2]} > ""$userId"_pipe"
            ;;
        *)
            # if the user enters an unknown command then we tell them the accepted commands
            echo "Accepted Commands: create, add, post, display" > ""$userId"_pipe"
    esac
done
