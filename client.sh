#! /bin/bash
if [ $# -eq 0 ]; then
    echo "Sorry please enter an id"

else
    mkfifo ""$1"_pipe"
    while [ 0 = 0 ]; do
        IFS=" " read -ra inpt_array
        if [ ${#inpt_array[@]} -ge 2 ]
            echo ""$1" + "$inpt_array[@]"" > server_pipe
        else
            echo "sorry not enough arguments!"
        fi
    done
    rm ""$1"_pipe"
fi

