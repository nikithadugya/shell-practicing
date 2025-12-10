#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\[e33m"
Normal="\e[0m"



LOGS_FOLDER="/var/log/shell-practicing"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 ) # $0 --> Current file name  --> 14-logs
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER  # -p means if directory is not there it creates if directory is there is keeps quiet
echo "Script started executed at: $(date)" | tee -a $LOG_FILE  # tee command appends the output printing of this command on mobexterm same in LOg file as well.
USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root(sudo) privilage"
    exit 1 #any number is failure other than 0
fi


VALIDATE(){
if [ $1 -ne 0 ]; then
    echo "Installation $2... $R FAILURE $N"
    exit 1
else
    echo "Installation $2 ... $G success $N"
fi
}

#loops use chesi dynamic ga user nunchi input thiskundam anukuntunna not like hardcoding like nginx,mysql ani ivvakunda code lo so $@ anni arguments anni osthai --> script ki pass chesina arguments anni osthai 
for package in $@ #--> while executing in mobexterm give as  sh 16-loops.sh mysql nginx python3
do

    dnf list installed $package &>>$LOG_FILE
      #install if it is not installed
         if [ $? -ne 0 ]; then
            dnf install $package -y &>>LOG_FILE
            VALIDATE $? "$package"
    else
         echo -e "$package already exists... $Y SKIPPING $N"
    fi