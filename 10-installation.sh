#!/bin/bash

USERID=$(id -u)

if($USERID -eq 0); then
    dnf install mysql -y
   # echo "ERROR:: Please run this script with root(sudo) privilage"
    #exit 1 #any number is failure other than 0
else
    echo "ERROR:: Please run this script with root(sudo) privilage"
fi

