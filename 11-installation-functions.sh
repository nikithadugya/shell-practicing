#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root(sudo) privilage"
    exit 1 #any number is failure other than 0
fi

#after executing first if statement it goes to line no 20 installs and then validate function line no 21 then comes to line no 10 to function.

VALIDATE(){
if [ $1 -ne 0 ]; then
    echo "ERROR:: Installation $2 is failure"
    exit 1
else
    echo "Installation $2 is success"
fi
}


dnf install mysql -y
VALIDATE $? "MYSQL"  #here we are passing arguments $? -> $1 and "mysql" -> $2

dnf install nginx -y
VALIDATE $? "NGINX"

dnf install python3 -y
VALIDATE $? "PYTHON3"
