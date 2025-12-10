#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\[e33m"
Normal="\e[0m"

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root(sudo) privilage"
    exit 1 #any number is failure other than 0
fi

#after executing first if statement it goes to line no 20 installs and then validate function line no 21 then comes to line no 10 to function.

VALIDATE(){
if [ $1 -ne 0 ]; then
    echo "Installation $2... $R FAILURE $N"
    exit 1
else
    echo "Installation $2 ... $G success $N"
fi
}

dnf list installed mysql #install if it is not installed
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "Mysql"
else
    echo -e "Mysql already exists... $Y SKIPPING $N"
fi


dnf install nginx -y
VALIDATE $? "NGINX"

dnf install python3 -y
VALIDATE $? "PYTHON3"
