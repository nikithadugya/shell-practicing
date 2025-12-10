
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

dnf list installed mysql &>>$LOG_FILE  #install if it is not installed
if [ $? -ne 0 ]; then
    dnf install mysql -y&>>$LOG_FILE
    VALIDATE $? "Mysql"
else
    echo -e "Mysql already exists... $Y SKIPPING $N"
fi


dnf list installed nginx &>>$LOG_FILE  #install if it is not installed
if [ $? -ne 0 ]; then
    dnf install nginx -y&>>$LOG_FILE
    VALIDATE $? "Nginx"
else
    echo -e "Nginx already exists... $Y SKIPPING $N"
fi

dnf list installed python3 &>>$LOG_FILE  #install if it is not installed
if [ $? -ne 0 ]; then
    dnf install python3 -y&>>$LOG_FILE
    VALIDATE $? "Python3"
else
    echo -e "Python3 already exists... $Y SKIPPING $N"
fi

