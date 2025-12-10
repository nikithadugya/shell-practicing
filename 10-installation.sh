#!/bin/bash

USERID=$(id -u) # execute (id -u) we get id of the user send that to USerid so while running the file in mobexterm we run with sudo so for sudo user id is 0 

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root(sudo) privilage"
    exit 1 #any number is failure other than 0
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Installation mysql is failure"
    exit 1
else
    echo "Installation is success"
fi

