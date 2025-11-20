#!/bin/bash

echo "All variables passed to the script: $@"
echo "All variables passed to the script: $*"
echo "Script name: $0"
echo "Current directory: $PWD"
echo "Who is running this: $USER"
echo "Home directory pf user: $HOME"
echo "PID of this current script:$$"
sleep 50 & # this is running in the background
echo "PID of the last command in background is: $!"
