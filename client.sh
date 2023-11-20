#! /bin/bash
if [ $# -eq 0 ]; then
    echo "Sorry please enter an id"

else
    mkfifo ""$1"_pipe"
    while [ 0 = 0 ]; do
        IFS=" " read -ra inpt_array
        for element in "${inpt_array[@]}"; do
            echo "$element"
        done
    done
    rm ""$1"_pipe"
fi

