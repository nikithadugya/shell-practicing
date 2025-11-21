#!/bin/bash

USERID=$(id -u)

if[ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root(sudo) privilage"
    exit 1 #any number is failure other than 0
else
    echo "ERROR:: Please run this script with root(sudo) privilage"
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Installation mysql is failure""
else
    echo "Installation is success"
fi

