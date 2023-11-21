#! /bin/bash
exiting(){ #function to run when ctrl+c is called
    rm ""$1"_pipe" #remove user pipe
    exit 0 #exit program
}

trap ""exiting" "$1"" SIGINT # this traps the ctrl+c command and calls the exiting function

if [ $# -eq 0 ]; then # if there are no arguments, print error
    echo "Sorry please enter an id"

else
    mkfifo ""$1"_pipe" # make a new pipe named [USERID]_pipe
    while [ 0 = 0 ]; do #infinite loop
        IFS=" " read -ra inpt_array #this reads in the input and stores it to an array, seperating the values after every space.
        if [ ${#inpt_array[@]} -ge 2 ]; then # this checks that there is a command and at least one argument
            
            case ${inpt_array[0]} in # this checks what the command is
                create) # if the command is "create", the program tries to acquire the createlock
                    bash ./acquire.sh "/locks/createlock.txt" "linkcreatelock.txt"
                    echo ""$1 " "${inpt_array[@]}"" > server_pipe #once the lock is acquired, the program sends the server the userId followed by the input command as one string
                    bash ./release.sh "linkcreatelock.txt" #releases the lock for the next user
                    ;;
                add) # all the other commands follow the same process as the create command: try to acquire lock -> once successful send the userid and the request to the server -> release the lock
                    bash ./acquire.sh "/locks/addlock.txt" "linkaddlock.txt"
                    echo ""$1 " "${inpt_array[@]}"" > server_pipe
                    bash ./release.sh "linkaddlock.txt"
                    ;;
                post)
                    bash ./acquire.sh "/locks/postlock.txt" "linkpostlock.txt"
                    echo ""$1 " "${inpt_array[@]}"" > server_pipe
                    bash ./release.sh "linkpostlock.txt"
                    ;;
                display)
                    bash ./acquire.sh "/locks/displaylock.txt" "linkdisplaylock.txt"
                    echo ""$1 " "${inpt_array[@]}"" > server_pipe
                    bash ./release.sh "linkdisplaylock.txt"
                    ;;
                *) # if the command isnt valid, print error
                    echo "please enter a valid command"
                    ;;
            esac
            

        else #if there isnt enough arguments provided, print error
            echo "sorry not enough arguments."
        fi
        #read response from the user pipe
        while read response; # this ensures that if there are multiple lines in the responce, then all the lines will be printed
        do
            echo -e $response
        done < ""$1"_pipe"
        
    done

    
    
fi



