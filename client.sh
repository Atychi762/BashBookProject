#! /bin/bash
mkfifo "$1"_pipe
read inpt > server_pipe

fclose("$1"_pipe)

