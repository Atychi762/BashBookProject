#! /bin/bash
mkfifo ""$1"_pipe"
read inpt > server_pipe
echo < ""$1"_pipe"
fclose( ""$1"_pipe" )

