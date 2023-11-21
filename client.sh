#! /bin/bash
if [ $# -eq 0 ]; then
    echo "Sorry please enter an id"

else
    mkfifo ""$1"_pipe"
    while [ 0 = 0 ]; do
        IFS=" " read -ra inpt_array
        if [ ${#inpt_array[@]} -ge 2 ]; then
            
            case ${inpt_array[0]} in
                create)
                    bash ./acquire.sh "/locks/createlock.txt" "linkcreatelock.txt"
                    echo ""$1 " "${inpt_array[@]}"" > server_pipe
                    bash ./release.sh "linkcreatelock.txt"
                    ;;
                add)
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
                *)
                    echo "please enter a valid command"
                    ;;
            esac
            

        else 
            echo "sorry not enough arguments."
        fi
        #read response < ""$1"_pipe"
        while read response;
        do
            echo -e $response
        done < ""$1"_pipe"
        
    done
    rm ""$1"_pipe"
fi

